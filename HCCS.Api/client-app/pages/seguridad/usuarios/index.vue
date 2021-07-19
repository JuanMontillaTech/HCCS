<template>
  <div>
    <modal :show="modals.form" :size="lg" body-classes="p-0">
      <div v-if="modals.form">
        <user-modal :modals="modals" />
      </div>
    </modal>
        <card
          class="no-border-card"
          body-classes="px-0 pb-1"
          footer-classes="pb-2"
        >
          <template slot="header">
            <div class="row">
              <div class="col-6">
                <h3 class="mb-0">Listado de usuarios</h3>
              </div>
              <div
                class="col-6 d-flex justify-content-center justify-content-sm-end flex-wrap"
              >
                <div class="col-6 text-right">
                  <button
                    type="button"
                    v-on:click="OpenModalForm(null, 'add')"
                    class="btn btn-primary btn-sm"
                  >
                    <i class="fas fa-plus-circle"></i>
                    <span class="btn-inner--text">Nuevo</span>
                  </button>
                </div>
              </div>
            </div>
            <p class="text-sm mb-0">
              Se muestran todos los usuarios agregados al sistema
            </p>
          </template>
          <div>
            <div
              class="col-12 d-flex justify-content-center justify-content-sm-between flex-wrap mb-2"
            >
              <el-select
                class="select-primary pagination-select"
                v-model="pagination.perPage"
                placeholder="Per page"
              >
                <el-option
                  class="select-primary"
                  v-for="item in pagination.perPageOptions"
                  :key="item"
                  :label="item"
                  :value="item"
                >
                </el-option>
              </el-select>
            </div>

            <el-table
              :data="tableData"
              class="table-responsive align-items-center table-flush"
              header-row-class-name="thead-light"
            >
              <el-table-column label="Id" min-width="200px">
                <template v-slot="{ row }">
                  <div class="media-body text-muted">
                    <span
                      type="button"
                      v-on:click="OpenModalForm(row, 'update')"
                      class="font-weight-600 name mb-0 text-sm"
                      >{{ row.id }}</span
                    >
                  </div>
                </template>
              </el-table-column>

              <el-table-column
                label="Nombre"
                prop="firstName"
                min-width="150px"
              />

              <el-table-column
                label="Apellido"
                prop="lastName"
                min-width="150px"
              />

              <el-table-column label="Estado" prop="status" min-width="100px">
                <template v-slot="{ row }">
                  <span v-if="row.enable == true" class="badge badge-success"
                    >Activo
                  </span>
                  <span v-else class="badge badge-primary">Inactivo </span>
                </template>
              </el-table-column>
            </el-table>
          </div>
          <div
            slot="footer"
            class="col-12 d-flex justify-content-center justify-content-sm-between flex-wrap"
          >
            <div class="">
              <p class="card-category">
                Mostrando {{ from + 1 }} - {{ to }} de
                {{ pagination.total }} perfiles
              </p>
            </div>

            <base-pagination
              class="pagination-no-border"
              v-model="pagination.currentPage"
              :per-page="pagination.perPage"
              :total="pagination.total"
              :pageCount="pagination.pageCount"
              @input="changePage"
            >
            </base-pagination>
          </div>
        </card>

  </div>
</template>
<script>
import { Table, TableColumn, Select, Option } from "element-ui";
import RouteBreadCrumb from "@/components/argon-core/Breadcrumb/RouteBreadcrumb";
import { BasePagination } from "@/components/argon-core";
import serverPagination from "~/components/app/serverPagination";
import UserModal from "@/components/users/UserModal.vue";

export default {
  mixins: [serverPagination],
  layout: "DashboardLayout",
  components: {
    BasePagination,
    RouteBreadCrumb,
    [Select.name]: Select,
    [Option.name]: Option,
    [Table.name]: Table,
    [TableColumn.name]: TableColumn,
    UserModal,
  },

  data() {
    return {
      controller: "user",
      modals: {
        form: false,
      },
    };
  },
  methods: {
    OpenModalForm(item, mode) {
      this.modals.mode = mode;
      this.modals.item = item;
      this.modals.tableData = this.tableData;
      this.modals.form = true;
    },
  },
};
</script>
