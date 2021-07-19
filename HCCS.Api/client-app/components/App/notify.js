export default {
  methods: {
    notifySuccess(message = "¡Operación realizada correctamente!") {
      this.$notify({
        title: "¡En hora buena!",
        message: message,
        timeout: 5000,
        icon: "ni ni-check-bold",
        type: "success",
      });
    },
    notifyFailed(message = "¡La operación NO se completó correctamente!") {
      this.$notify({
        title: "¡Lo sentimos!",
        message: message,
        timeout: 5000,
        icon: "ni ni-fat-remove",
        type: "danger",
      });
    },
  }
}