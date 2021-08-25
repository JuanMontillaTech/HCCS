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
                          v-model="ResultStatusDto.dateStart"
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
                          v-model="ResultStatusDto.dateEnd"
                        >
                        </flat-picker>
                      </base-input>
                    </div>
                  </div>

                  <div class="row">
                    <div class="col-md-4">
                      <base-input
                        label="Institucion"
                        name="Institucion"
                        :rules="{ required: true }"
                        v-model="ResultStatusDto.institution"
                      ></base-input>
                    </div>
                    <div class="col-md-4">
                      <base-input
                        label="Codigo"
                        name="Codigo"
                        :rules="{ required: true }"
                        v-model="ResultStatusDto.code"
                      ></base-input>
                    </div>
                  </div>
                  <div class="row">
                    <div class="col-md-4">
                      <base-input
                        label="No. Hnas"
                        name="No. Hnas"
                        :rules="{ required: true }"
                      >
                      </base-input>
                    </div>
                    <div class="col-md-4">
                      <base-input
                        label="Empleados"
                        name="Empleados"
                        :rules="{ required: true }"
                        v-model="ResultStatusDto.employees"
                      ></base-input>
                    </div>
                  </div>
        <div class="row">
         <div class="col-8">
      

                  <table  tyle="width:50%" class="table table-striped table-hover table-bordered" >
                    <thead>
                      <tr>
                        <td  >
                          Código
                        </td>
                        <td >
                          Nombre de cuenta
                        </td>
                        <td  >
                          monto
                        </td>
                      </tr>
                    </thead>
                    <h3>INGRESOS / ENTRADAS</h3>
                    <tbody v-for="(item, index) in ResultStatusDto.resultStatusDetails"
                    :key="index">

                      <tr  v-if=" item.accountNumber < 6000" class=" form-control-sm">
                        <td>
                         <h4> {{ item.accountNumber }}</h4> 
                        </td>
                        <td>
                        <h4> {{ item.accountName }}</h4>   
                        </td>
                        <td>
                          <base-input>
                            <div class="input-group mb-3">
                              <span
                                class="input-group-text form-control-sm"
                                id="basic-addon3"
                                >$</span
                              >
                              <input
                                class="form-control form-control-sm"
                                v-model="item.amount"
                                type="text"
                                id="basic-url"
                                
                                aria-describedby="basic-addon3"
                              />
                            </div>
                          </base-input>
                        </td>
                      </tr>
                    </tbody>
                      <h3>EGRESOS</h3>
                    <tbody v-for="(item, index) in ResultStatusDto.resultStatusDetails"
                    :key="index">

                      <tr  v-if=" item.accountNumber >= 6000" class=" form-control-sm">
                    <td>
                         <h4> {{ item.accountNumber }}</h4> 
                        </td>
                        <td>
                        <h4> {{ item.accountName }}</h4>   
                        </td>
                        <td>
                          <base-input>
                            <div class="input-group mb-3">
                              <span
                                class="input-group-text form-control-sm"
                                id="basic-addon3"
                                >$</span
                              >
                              <input
                                class="form-control form-control-sm"
                                v-model="item.amount"
                                type="text"
                                id="basic-url"
                                aria-describedby="basic-addon3"
                              />
                            </div>
                          </base-input>
                        </td>
                      </tr>
                    </tbody>
                  </table>

                </div>
        </div>
                  <div class="card-footer">
                    <base-button type="defalut">Cancelar</base-button>
                    <base-button type="primary" v-on:click="SendSatud()"
                      >Enviar</base-button
                    >
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
import { Table } from "element-ui";

export default {
  layout: "DashboardLayout",
  components: {
    flatPicker
  },
  data() {
    return {
      Accounts: [],
      ResultStatusDto: {
        dateStart: "",
        dateEnd: "",
        code: "",
        sisters: 0,
        employees: 0,
        institution: "",
        resultStatusDetails: []
      }
    };
  },
  methods: {
    AddResultStatusDetails(row) {
      this.ResultStatusDto.resultStatusDetails.push({
        accountNumber: row.accountNumber,
        id: row.id,
        amount: 0,
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
    },
    SendSatud: async function() {
      var data = this.ResultStatusDto;
      console.log(data);
      this.$axios
        .$post("/AccountingService/ResultStatus", data)
        .then(res => {})
        .catch(({ response: err }) => {});
    }
  },
  mounted() {
    this.GetAccounts();
  }
};
</script>
<style></style>
