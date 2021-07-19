<template>
  <div
    class="container d-flex align-items-center justify-content-center flex-column"
  >
    Cargando...
{{this.$auth}}

  </div>
</template>

<script>
/* eslint-disable no-new */

  export default {
     layout: 'DashboardLayout',
    data() {
    return {
      data: "",


    };
  },
    methods: {
      show (){

 this.data = JSON.stringify(this.$store.state.auth.user, undefined, 2);

      }

    },
    mounted() {

      this.show();

    }
  };
</script>

<style scoped>
.container {
  min-height: 70vh;
}
</style>
