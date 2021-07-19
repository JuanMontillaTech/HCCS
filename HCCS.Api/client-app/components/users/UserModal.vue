<template>
  <card

    header-classes="bg-transparent pb-5"
    body-classes="px-lg-5 py-lg-5"
    class="border-0 mb-0"
  >
    <template>
      <div class="text-center text-success mb-4">
        <h4 v-if="modals.mode == 'add'">Crear Nuevo usuario</h4>
        <h4 v-else>Actualizar usuario</h4>
      </div>

      <validation-observer v-slot="{ handleSubmit }">
        <form @submit.prevent="handleSubmit(formSubmit)">
          <div v-if="modals.mode == 'add'" class="row">
            <div class="col-12">
              <base-input label="Cuenta de usuario">
                <el-select
                  v-model="selectedItemId"
                  @input="selectedChanged"
                  placeholder="id, nombre, email..."
                  filterable
                  remote
                  clearable
                  no-data-text="¡No hay datos!"
                  loading-text="Cargando..."
                  :remote-method="filter"
                  :loading="loading"
                >
                  <el-option
                    style="height: 50px"
                    v-for="item in items"
                    :key="item.id"
                    :label="`${item.firstName} ${item.lastName}`"
                    :value="item.id"
                  >
                    <user-card-item :user="item" />
                  </el-option>
                </el-select>
              </base-input>
            </div>
          </div>
          <div class="row">
            <div class="col-12">
              <user-card
                v-if="modals.mode == 'add' && selectedItem.id"
                :user="selectedItem"
              />
              <user-card
                v-if="modals.mode == 'update' && selectedItem.id"
                :user="selectedItem"
                :renderName="true"
              />
            </div>
          </div>
          <div class="row">
            <div class="col-12">
              <base-input label="Perfiles">
                <el-select
                  v-model="selectedProfiles"
                  multiple
                  filterable
                  placeholder="selecionar perfil"
                >
                  <el-option
                    v-for="profile in profiles"
                    :key="profile.id"
                    :label="profile.name"
                    :value="profile.id"
                  >
                  </el-option>
                </el-select>
              </base-input>
            </div>
          </div>
          <div class="row mt-2">
            <div class="col-12">
              <base-checkbox
                v-if="
                  (modals.mode == 'update' && selectedItem.id) ||
                  modals.mode == 'add'
                "
                v-model="enable"
              >
                Activo
              </base-checkbox>
            </div>
          </div>

          <div class="text-center">

            <base-button type="defalut"  v-on:click="modals.form = false"
                  >Cancelar</base-button
                >
                   <base-button class="my-4" type="primary" native-type="submit"
              >Agregar
            </base-button>
          </div>
        </form>
      </validation-observer>
    </template>
  </card>
</template>
<script>
import { Modal } from "@/components/argon-core";
import { Select, Option } from "element-ui";
import swal from "sweetalert2";
import UserCardItem from "@/components/users/UserCardItem.vue";
import serverFilter from "@/components/app/serverFilter";
import notify from "@/components/app/notify";
import UserCard from "@/components/users/UserCard.vue";

export default {
  mixins: [serverFilter, notify],
  name: "UserModal",
  layout: "DashboardLayout",
  components: {
    Modal,
    [Select.name]: Select,
    [Option.name]: Option,
    UserCardItem,
    UserCard,
  },
  props: ["modals"],
  async created() {
    if (this.modals.mode == "update") {
      this.selectedItem = await this.$axios.$get(
        `/user/${this.modals.item.id}`
      );
      this.enable = this.selectedItem.enable;
      this.selectedProfiles = this.selectedItem.profiles.map(
        (x) => x.profileId
      );
    }
    this.profiles = await this.$axios.$get(`/profile/enabled`);
  },
  data() {
    return {
      filterUrl: "user/usersActiveDirectory",
      selectedItem: {},
      selectedProfiles: [],
      profiles: [],
      enable: true,
    };
  },
  methods: {
    async formSubmit() {
      swal
        .fire({
          title:
            this.modals.mode == "add"
              ? "¿Seguro que desea agregar este nuevo Usuario?"
              : "¿Seguro que desea actualizar este Usuario?",
          text: "¡Los cambios se aplican inmediatamente!",
          icon: "warning",
          showCancelButton: true,
          confirmButtonText:
            this.modals.mode == "add" ? "Agregar" : "Actualizar",
          cancelButtonText: "Cancelar",
        })
        .then((result) => {
          if (result.isConfirmed) this.saveUser();
        });
    },
    saveUser() {
      const user = {
        id: this.selectedItem.id,
        enable: this.enable,
        profiles: this.selectedProfiles.map((x) => {
          return { profileId: x };
        }),
      };
      if (this.modals.mode == "add") {
        this.addUser(user);
      } else this.updateUser(user);
    },
    addUser(user) {
      this.$axios
        .$post("/user", user)
        .then((res) => {
          this.notifySuccess();
          this.modals.tableData.push({
            id: res.id,
            firstName: res.firstName,
            lastName: res.lastName,
          });
          this.modals.form = false;
        })
        .catch(({ response: err }) => {
          this.notifyFailed(err.data.message);
        });
    },
    updateUser(user) {
      this.$axios
        .$put("/user", user)
        .then((res) => {
          this.notifySuccess();

          this.modals.tableData
            .filter((x) => x.id == user.id)
            .forEach((e) => (e.enable = res.enable));

          this.modals.form = false;
        })
        .catch(({ response: err }) => {
          this.notifyFailed(err.data.message);
        });
    },
  },
};
</script>

<style>
.form-group {
  margin-bottom: 0rem;
}
.form-control[readonly] {
  background-color: #fff;
}

.swal2-styled.swal2-confirm {
  background-color: #e4002b;
}
.swal2-styled:focus {
  box-shadow: 0 0 0 2px rgb(236, 236, 236);
}

.swal2-styled.swal2-cancel {
  background-color: #fff;
  color: black;
}
.btn-default {
  background-color: #fff;
  color: black;
  border: 0px;
}


.swal2-icon.swal2-warning {
  border-color: #ffbf00;
  color: #ffbf00;
}

.swal2-content {
  color: #8d8d8d;
}
</style>
