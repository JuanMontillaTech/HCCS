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
      <div class="row">
        <div class="col-lg-6">
          <div class="card-wrapper">
            <card>
              <h3 slot="header" class="mb-0">Crear Nuevo Perfil de usuario</h3>
              <form>
                <div class="row">
                  <div class="col-12">
                    <label class="form-control-label">Nombre</label>
                    <base-input
                      v-model="profile.name"
                      prepend-icon="fas fa-user"
                      placeholder="Nombre"
                    ></base-input>
                  </div>
                </div>
                <div class="row">
                  <div class="col-12">
                    <textarea
                      v-model="profile.description"
                      rows="4"
                      placeholder="Descripción del nuevo perfil de usuario..."
                      class="form-control"
                    >
                    </textarea>
                  </div>
                </div>
                <div class="row mt-2">
                  <div class="col-12">
                    <base-checkbox v-model="profile.status" :type="success">
                      Activo
                    </base-checkbox>
                  </div>
                </div>
                <div>
                  <base-button
                    class="my-4"
                    type="primary"
                    @click.native="addSwal()"
                    >Actualizar</base-button
                  >
                  <nuxt-link to="/seguridad/perfiles" class="btn btn-default">
                    <span class="btn-inner--text">Volver atrás</span>
                  </nuxt-link>
                </div>
              </form>
            </card>
          </div>
        </div>
        <div class="col-lg-6">
          <div class="card-wrapper">
            {{profile.permissions}}
            <card>
              <h3 slot="header" class="h3 mb-0">Lista de Permisos</h3>
              <ul class="list-group list-group-flush" data-toggle="checklist">
                <li
                  class="checklist-entry list-group-item flex-column align-items-start"
                  v-for="permission in profile.permissions"
                  :key="permission.id"
                >
                  <div
                    class="checklist-item pt-0 pb-0"
                    :class="{
                      'checklist-item-checked': !permission.done,
                      [`checklist-item-success`]: permission.done,
                    }"
                  >
                    <div class="checklist-info">
                      <h5 class="checklist-title mb-0">
                        {{ permission.name }}
                      </h5>
                    </div>
                    <div>
                      <base-checkbox
                        v-model="permission.done"
                        :type="permission.done ? 'success' : 'danger'"
                      />
                    </div>
                  </div>
                </li>
              </ul>
            </card>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>
<script>
import RouteBreadCrumb from "@/components/argon-core/Breadcrumb/RouteBreadcrumb";
import { Modal } from "@/components/argon-core";
import swal from "sweetalert2";

export default {
  layout: "DashboardLayout",
  components: {
    RouteBreadCrumb,
    Modal,
  },

  async created() {
    const id = this.$route.params.id;
    const prof = await this.$axios.$get(`/profile/${id}`);
    const permissions = await this.$axios.$get(`/profile/permissions`);

    permissions.forEach((permission) => {
      permission.done = prof.permissions.some((o) => o.id === permission.id);
    });

    this.profile = prof;
    this.profile.permissions = permissions;
  },
  data() {
    return {
      profile: {},
    };
  },
  methods: {
    addSwal() {
      swal
        .fire({
          title: "¿Seguro que desea actualizar este Perfil?",
          text:
            "Esta operación se aplicará a los todos los usuarios relacionados!",
          icon: "warning",
          showCancelButton: true,
          confirmButtonText: "Actualizar",
          cancelButtonText: "Cancelar",
        })
        .then((result) => {
          if (result.isConfirmed) this.updateProfile();
        });
    },
    updateProfile() {
      const upProfile = {
        id: this.profile.id,
        name: this.profile.name,
        description: this.profile.description,
        status: this.profile.status,
        permissions: this.profile.permissions.filter((a) => a.done),
      };

      this.$axios
        .$put("/profile", upProfile)
        .then((res) => {
          this.notifyVue("success");
        })
        .catch(({ response: err }) => {
          this.notifyVueFail(err.message);
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
