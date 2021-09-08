<template>
  <card
    type="lighter"
    header-classes="bg-transparent pb-5"
    body-classes="px-lg-5 py-lg-5"
    class="border-0 mb-0"
  >
    <template>
      <div class="text-center text-success mb-4">
        <h4 v-if="modals.mode == 'add'">Crear Nuevo Perfil de Usuario</h4>
        <h4 v-else>Actualizar Perfil de Usuario</h4>
      </div>

      <validation-observer v-slot="{ handleSubmit }">
        <form @submit.prevent="handleSubmit(formSubmit)">
          <div class="row">
            <div class="col-12">
              <base-input
                label="Nombre"
                v-model="profile.name"
                prepend-icon="fas fa-user"
                placeholder="Nombre del nuevo perfil de usuario"
              ></base-input>
            </div>
          </div>
          <div class="row mt-2">
            <div class="col-12">
              <textarea
                v-model="profile.description"
                placeholder="Descripción del nuevo perfil de usuario..."
                class="form-control"
              >
              </textarea>
            </div>
          </div>
          <div class="row">
            <div class="col-12">
              <base-input label="Permisos">
                <el-select
                  v-model="selectedPermissions"
                  multiple
                  filterable
                  no-match-text="¡No hay coincidencias!"
                  collapse-tags
                  placeholder="selecionar permisos"
                >
                  <el-option
                    v-for="permission in permissions"
                    :key="permission.id"
                    :label="permission.name"
                    :value="permission.id"
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
                  (modals.mode == 'update' && profile) || modals.mode == 'add'
                "
                v-model="profile.status"
              >
                Activo
              </base-checkbox>
            </div>
          </div>

          <div class="text-center">
            <base-button type="primary" native-type="submit"
              >Agregar
            </base-button>
            <base-button type="default" v-on:click="modals.form = false"
              >Cancelar
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
import notify from "@/components/app/notify";
import UserCard from "@/components/users/UserCard.vue";

export default {
  mixins: [notify],
  name: "ProfileModal",
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
      this.profile = await this.$axios.$get(`/profile/${this.modals.item.id}`);
      this.selectedPermissions = this.profile.permissions.map((x) => x.id);
    }
    this.permissions = await this.$axios.$get(`/profile/permissions`);
  },
  data() {
    return {
      profile: { status: true },
      permissions: [],
      selectedPermissions: [],
    };
  },
  methods: {
    async formSubmit() {
      swal
        .fire({
          title:
            this.modals.mode == "add"
              ? "¿Seguro que desea agregar este nuevo Perfil de Usuario?"
              : "¿Seguro que desea actualizar este Perfil de Usuario?",
          text: "¡Los cambios se aplican inmediatamente!",
          icon: "warning",
          showCancelButton: true,
          confirmButtonText:
            this.modals.mode == "add" ? "Agregar" : "Actualizar",
          cancelButtonText: "Cancelar",
        })
        .then((result) => {
          if (result.isConfirmed) this.saveProfile();
        });
    },
    saveProfile() {

      this.profile.permissions = this.selectedPermissions.map((x) => {
        return { id: x };
      });
      if (this.modals.mode == "add") {
        this.addProfile(this.profile);
      } else this.updateProfile(this.profile);
    },
    addProfile(profile) {
      this.$axios
        .$post("/profile", profile)
        .then((res) => {
          this.notifySuccess();
          this.modals.tableData.push(res);
          this.modals.form = false;
        })
        .catch(({ response: err }) => {
          this.notifyFailed(err.data.message);
        });
    },
    updateProfile(profile) {
      this.$axios
        .$put("/profile", profile)
        .then((res) => {
          this.notifySuccess();
          this.modals.tableData
            .filter((x) => x.id == profile.id)
            .forEach((e) => {
              (e.name = profile.name),
                (e.description = profile.description),
                (e.status = profile.status);
            });

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
  background-color: #172b4d;
}

.swal2-icon.swal2-warning {
  border-color: #ffbf00;
  color: #ffbf00;
}

.swal2-content {
  color: #8d8d8d;
}
</style>
