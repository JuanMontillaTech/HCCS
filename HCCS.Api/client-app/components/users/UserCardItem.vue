<template>
  <div class="row">
    <div>
      {{ user.firstName }}
      {{ user.lastName }}

      <small :class="`text-${user.enable ? 'success' : 'primary'}`"> ●</small>
      <small v-if="user.enable" class="badge badge-success">Activo</small>
      <small v-else class="badge badge-primary">Inactivo</small>

      <small class="text text-muted"
        >{{ user.email }}
        <strong> {{ user.title }}</strong>
      </small>
    </div>
  </div>
</template>
<script>
export default {
  name: "UserCardItem",
  props: ["user"],
};
</script>

<style scope>
.text {
  display: block;
  line-height: 0;
}
</style>