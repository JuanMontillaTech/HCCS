<template>
  <div>
    <base-header class="pb-6">
      <div class="row align-items-center py-4">
        <div class="col-lg-6 col-7">
          <h6 class="h2 text-white d-inline-block mb-0">Inicio</h6>
          <nav aria-label="breadcrumb" class="d-none d-md-inline-block ml-md-1">
            <route-bread-crumb></route-bread-crumb>
          </nav>
        </div>
      </div>
    </base-header>
    <div class="container-fluid mt--6">
      <div>
        <div>
          <card
            class="no-border-card"
            body-classes="px-0 pb-1"
            footer-classes="pb-2"
          >
            <template slot="header">
              <h3>Crear Nuevo usuario</h3>
            </template>
            <div class="row ml-3 mr-3">
              <div class="col-md-6">
                <form>
                  <div class="row">
                    <div class="col-12">
                      <label class="form-control-label"
                        >Cuenta de usuario</label
                      >
                      <base-input>
                        <el-select
                          v-model="selectedItemId"
                          @input="selectedChanged"
                          placeholder="id, nombre, email..."
                          filterable
                          remote
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
                      <user-card v-if="selectedItem.id" :user="selectedItem" />
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
                  <div class="row">
                    <div class="col-12">
                      <base-checkbox v-model="userStatus" :type="success">
                        Activo
                      </base-checkbox>
                    </div>
                  </div>
                  <div>
                    <base-button
                      class="my-4"
                      type="primary"
                      @click.native="addSwal()"
                      >Guardar</base-button
                    >
                  </div>
                </form>
              </div>
            </div>
          </card>
        </div>
      </div>
    </div>
  </div>
</template>
<script>
import RouteBreadCrumb from "@/components/argon-core/Breadcrumb/RouteBreadcrumb";
import { Modal } from "@/components/argon-core";
import swal from "sweetalert2";
import { Select, Option } from "element-ui";
import UserCard from "../../../components/users/UserCard.vue";
import serverFilter from "~/components/app/serverFilter";
import UserCardItem from "../../../components/users/UserCardItem.vue";

export default {
  mixins: [serverFilter],
  layout: "DashboardLayout",
  components: {
    RouteBreadCrumb,
    Modal,
    UserCard,
    UserCardItem,
    [Select.name]: Select,
    [Option.name]: Option,
  },

  async created() {
    const res = await this.$axios.$get(`/profile/enabled`);
    res.forEach((profile) => {
      profile.done = false;
    });
    this.profiles = res;
  },
  data() {
    return {
      filterUrl: "user/usersActiveDirectory",
      userStatus: true,
      selectedProfiles: [],
      user: {},
      users: [],
      profiles: [],
    };
  },
  methods: {
    addSwal() {
      swal
        .fire({
          title: "¿Seguro que desea agregar este nuevo Usuario?",
          text: "Se agregará este Nuevo Usuario al sistema!",
          icon: "warning",
          showCancelButton: true,
          confirmButtonText: "Agregar",
          cancelButtonText: "Cancelar",
        })
        .then((result) => {
          if (result.isConfirmed) this.addUser();
        });
    },
    addUser() {
      const newUser = {
        id: this.selectedItemId,
        enable: this.userStatus,
        profiles: this.profiles
          .filter((a) => a.done)
          .map((x) => {
            return { profileId: x.id };
          }),
      };
      this.$axios
        .$post("/user", newUser)
        .then((res) => {
          this.notifyVue("success");
          this.$router.push("/seguridad/usuarios");
        })
        .catch(({ response: err }) => {
          this.notifyVueFail(err.data.message);
        });
    },
    notifyVue(type = "default") {
      this.$notify({
        message: "¡En hora buena! <b>Asignación realizada correctamente.</b>",
        timeout: 5000,
        icon: "ni ni-check-bold",
        type,
      });
    },
    notifyVueFail(error) {
      this.$notify({
        message: "¡Lo sentimos! <b>" + error + "</b>",
        timeout: 5000,
        icon: "ni ni-fat-remove",
        type: "danger",
      });
    },
  },
};
</script>