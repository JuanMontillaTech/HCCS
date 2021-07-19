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
              <h3>Detalle de Usuario</h3>
            </template>
            <div class="row ml-3 mr-3">
              <div class="col-md-7">
                <form>
                  <div class="row">
                    <div class="col-12">
                      <user-card
                        v-if="user.id"
                        :renderName="true"
                        :user="user"
                      />
                    </div>
                  </div>
                  <div class="row mt-2">
                    <div class="col-12">
                      <base-checkbox v-model="user.enable" :type="success">
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
              <div class="col-md-3">
                <label class="form-control-label">Perfiles</label>
                <div>
                  <ul
                    class="list-group list-group-flush"
                    data-toggle="checklist"
                  >
                    <li
                      class="checklist-entry list-group-item align-items-start"
                      v-for="profile in profiles"
                      :key="profile.id"
                    >
                      <div
                        class="checklist-item pt-0 pb-0"
                        :class="{
                          'checklist-item-checked': !profile.done,
                          [`checklist-item-success`]: profile.done,
                        }"
                      >
                        <div class="checklist-info">
                          <h5 class="checklist-title mb-0">
                            {{ profile.name }}
                          </h5>
                        </div>
                        <div>
                          <base-checkbox
                            v-model="profile.done"
                            :type="profile.done ? 'success' : 'danger'"
                          />
                        </div>
                      </div>
                    </li>
                  </ul>
                </div>
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
import UserCard from "@/components/users/UserCard.vue";

export default {
  layout: "DashboardLayout",
  components: {
    RouteBreadCrumb,
    Modal,
    UserCard,
  },

  async created() {
    const id = this.$route.params.id;
    this.user = await this.$axios.$get(`/user/${id}`);
    const profiles = await this.$axios.$get(`/profile/enabled`);

    profiles.forEach((profile) => {
      profile.done = this.user.profiles.some((o) => o.profileId === profile.id);
    });

    this.profiles = profiles;
  },

  data() {
    return {
      user: {},
      profiles: [],
    };
  },
  methods: {
    addSwal() {
      swal
        .fire({
          title: "¿Seguro que desea actualizar este Usuario?",
          text:
            "¡Esta operación aplicara inmediatamente en las funcionales que el usuario puede realizar!",
          icon: "warning",
          showCancelButton: true,
          confirmButtonText: "Actualizar",
          cancelButtonText: "Cancelar",
        })
        .then((result) => {
          if (result.isConfirmed) this.updateUser();
        });
    },
    updateUser() {
      const updateUser = {
        id: this.user.id,
        enable: this.user.enable,
        profiles: this.profiles
          .filter((a) => a.done)
          .map((x) => {
            return { profileId: x.id };
          }),
      };
      this.$axios
        .$put("/user", updateUser)
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