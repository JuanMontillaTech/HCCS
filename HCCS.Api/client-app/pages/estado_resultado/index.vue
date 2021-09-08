<template>
  <div>
    <modal :show="modals.form" body-classes="p-0">
      <div v-if="modals.form">
        <profile-modal :modals="modals" />
      </div>
    </modal>

    <card class="no-border-card" body-classes="px-0 pb-1" footer-classes="pb-2">
      <template slot="header">
        <div class="row">
          <div class="col-6">
            <h3 class="mb-0">Estados Enviados</h3>
          </div>
          <div
            class="col-6 d-flex justify-content-center justify-content-sm-end flex-wrap"
          >
            <div class="col-6 text-right"></div>
          </div>
        </div>
        <p class="text-sm mb-0">Estados Enviados</p>
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
          <el-table-column label="institution">
            <template v-slot="{ row }">
              <div class="media-body text-muted">
                <span
                  type="button"
                  v-on:click="OpenModalForm(row, 'update')"
                  class="font-weight-600 name mb-0 text-sm"
                  >{{ row.institution }}</span
                >
              </div>
            </template>
          </el-table-column>
          <el-table-column label="Fecha Inicio">
            <template v-slot="{ row }" sortable>
              <div class="media-body text-muted">
                <span type="button" class="font-weight-600 name mb-0 text-sm">
                  {{ SetFormat(row.dateStart) }}
                </span>
              </div>
            </template>
          </el-table-column>

          <el-table-column label="Fecha Fin" sortable >
            <template v-slot="{ row }">
              <div class="media-body text-muted">
                <span type="button" class="font-weight-600 name mb-0 text-sm">
                  {{ SetFormat(row.dateEnd) }}
                </span>
              </div>
            </template>
          </el-table-column>

          <el-table-column label="Código" prop="code"  />

          <el-table-column label="Acciones"
                             
                             align="left"
                             prop="id"
                             size="sm"
                             sortable>
              <template v-slot="{ row }">
                <el-tooltip content="Ver" placement="bottom">
                  <base-button size="sm"
                               type="defalut"
                               tooltip
                               v-on:click="goView(row)">
                    <i class="fas fa-file-alt"></i>
                  </base-button>
                </el-tooltip>

             
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
import ProfileModal from "@/components/estado_resultado/estado_resultado.vue";
import serverPagination from "~/components/app/serverPagination";
import moment from "moment";
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
    ProfileModal
  },

  data() {
    return {
      controller: "ResultStatus",
      modals: {
        form: false,
        profile: {}
      }
    };
  },
  methods: {
    SetFormat: function(date) {
      let Des = moment(date, "YYYY/MM/DD");
      return Des.format("DD/MM/YYYY");
    },
    OpenModalForm(row, mode) {
      this.modals.mode = mode;
      this.modals.item = row;
      this.modals.tableData = this.tableData;
      this.modals.form = true;
    }
  }
};
</script>
