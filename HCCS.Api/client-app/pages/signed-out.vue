<template>
  <div

  >

    Redireccionamiento...
  </div>
</template>
<script>
import Vue from "vue";
export default Vue.extend({
  middleware: ["auth"],
  created() {
    this.$router.push("/");
  },
});
</script>

<style scoped>
.container {
  min-height: 70vh;
}
</style>
