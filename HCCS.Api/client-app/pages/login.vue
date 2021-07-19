<template>
  <div>


  </div>
</template>
<script>
  import Vue from "vue";
  export default Vue.extend({
    middleware: ['auth'],
    created() {
      if (this.$auth.$state.loggedIn != true) {
        this.$auth.loginWith("social");
      } else this.$router.push("/");
    },
  });
</script>

<style scoped>
  .container {
    min-height: 70vh;
  }
</style>
