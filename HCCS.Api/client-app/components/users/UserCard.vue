<template>
  <div class="card mb-2">
    <div class="card-body pt-2 pb-2">
      <div v-if="renderName == true" class="text-left text-success">
        <h4>{{ user.firstName }} {{ user.lastName }}</h4>
      </div>
      <div class="row">
        <div class="col">
          <div class="h5 mb-0">
            <i class="far fa-envelope text-primary"></i>
            <a :href="`mailto:${user.email}`">{{ user.email }}</a>
          </div>

          <small class="text-muted">
            {{ user.employeeId }}
            <span v-if="renderName != true">
              <small :class="`text-${user.enable ? 'success' : 'primary'}`">
                ●</small
              >
              <small v-if="user.enable" class="text-success">Activo</small>
              <small v-else class="text-primary">Inactivo</small>
            </span>
          </small>
          <div>
            <div>
              <small>
                <strong> {{ user.title }}</strong></small
              >
              <div>
                <small>
                  <small> {{ user.department }}</small>
                </small>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>
<script>
export default {
  name: "UserCard",
  props: ["user", "renderName"],
};
</script>

<style scoped>
a.alg {
  font-size: 10px;
}
</style>
