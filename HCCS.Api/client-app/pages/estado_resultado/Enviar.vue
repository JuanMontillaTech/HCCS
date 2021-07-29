<template>
  <div>
    <base-header class="pb-6">
      <div class="row align-items-center py-4">
        <div class="col-lg-6 col-7">
          <h6 class="h2 text-white d-inline-block mb-0">
            Envio de estado resultado
          </h6>
          <nav aria-label="breadcrumb" class="d-none d-md-inline-block ml-md-4">
            <route-bread-crumb></route-bread-crumb>
          </nav>
        </div>
      </div>
    </base-header>
    <div class="container-fluid mt--12">
      <validation-observer immediate ref="formValidator">
        <div class="row">
          <div class="col-lg-12">
            <div class="card-wrapper">
              <!-- Input groups -->
              <card>
                <!-- Card header -->
                <h3 slot="header" class="mb-12">
                  HERMANAS DE LA CARIDAD DEL CARDENAL SANCHA
                </h3>
                <h4 slot="header" class="mb-0">ESTADO DE RESULTADOS MENSUAL</h4>
                <!-- Card body -->
                <form>
                  <!-- Input groups with icon -->
                  <div class="row">
                    <div class="col-md-4">
                      <base-input
                        label="Para el mes"
                        name="Para el mes"
                        :rules="{ required: true }"
                      >
                        <flat-picker
                          slot-scope="{ focus, blur }"
                          @on-open="focus"
                          @on-close="blur"
                          :config="{ allowInput: true }"
                          class="form-control datepicker"
                        >
                        </flat-picker>
                      </base-input>
                    </div>
                    <div class="col-md-4">
                      <base-input
                        label="Terminando al"
                        name="Terminando al"
                        :rules="{ required: true }"
                      >
                        <flat-picker
                          slot-scope="{ focus, blur }"
                          @on-open="focus"
                          @on-close="blur"
                          :config="{ allowInput: true }"
                          class="form-control datepicker"
                        >
                        </flat-picker>
                      </base-input>
                    </div>
                  </div>

                  <div class="row">
                    <div class="col-md-6">
                      <base-input
                        label="Insitutcion"
                        name="Insitutcion"
                        :rules="{ required: true }"
                      ></base-input>
                    </div>
                    <div class="col-md-4">
                      <base-input
                        label="Codigo"
                        name="Codigo"
                        :rules="{ required: true }"
                      ></base-input>
                    </div>
                  </div>
                  <div class="row">
                    <div class="col-md-6">
                      <base-input
                        label="No. Hnas"
                        name="No. Hnas"
                        :rules="{ required: true }"
                      ></base-input>
                    </div>
                    <div class="col-md-4">
                      <base-input
                        label="Empleados"
                        name="Empleados"
                        :rules="{ required: true }"
                      ></base-input>
                    </div>
                  </div>
                  <div
                    v-for="(item, index) in ResultStatusDetails"
                    :key="index"
                  >
                    <div class="row">
                      <div class="col-md-6">
                        {{ item.accountNumber }} -
                        {{ item.accountName }}
                      </div>
                      <div class="col-md-4">
                        <base-input v-model="item.amount"></base-input>
                      </div>
                    </div>
                  </div>

                  <div class="card-footer">
                    <base-button type="defalut">Cancelar</base-button>
                    <base-button type="primary">Enviar</base-button>
                  </div>
                </form>
              </card>
            </div>
          </div>
        </div>
      </validation-observer>
    </div>
  </div>
</template>
<script>
import flatPicker from "vue-flatpickr-component";
import "flatpickr/dist/flatpickr.css";

export default {
  layout: "DashboardLayout",
  components: {
    flatPicker
  },
  data() {
    return {
      Accounts: [],
      ResultStatusDetails: [
      ]
    };
  },
  methods: {
    AddResultStatusDetails(row) {
      this.ResultStatusDetails.push({
        accountNumber: row.accountNumber,
        id: row.id,
        amount: "",
        accountName: row.accountName
      });
    },
    GetAccounts: async function() {
      this.$axios
        .$get("/AccountingService/Accounts")
        .then(res => {
          this.Accounts = res;

          this.Accounts.forEach(element =>
            this.AddResultStatusDetails(element)
          );
        })
        .catch(({ response: err }) => {});
    }
  },
  mounted() {
    this.GetAccounts();
  }
};
</script>
<style></style>
