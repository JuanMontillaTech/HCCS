<template>
  <div>
    <modal :show="modals.form" body-classes="p-0">
      <div v-if="modals.form">
        <profile-modal :modals="modals" />
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
                <h3 class="mb-0">Perfiles de usuario</h3>
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
            <p class="text-sm mb-0">Mantenimiento de perfiles de usuarios</p>
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
              <el-table-column label="Nombre">
                <template v-slot="{ row }">
                  <div class="media-body text-muted">
                    <span
                      type="button"
                      v-on:click="OpenModalForm(row, 'update')"
                      class="font-weight-600 name mb-0 text-sm"
                      >{{ row.name }}</span
                    >
                  </div>
                </template>
              </el-table-column>

              <el-table-column
                label="Descripción"
                prop="description"
                min-width="200px"
              />

              <el-table-column label="Estado" prop="status" min-width="55px">
                <template v-slot="{ row }">
                  <span v-if="row.status == true" class="badge badge-success"
                    >Activo
                  </span>

                  <span v-if="row.status == false" class="badge badge-primary"
                    >Inactivo
                  </span>
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
import ProfileModal from "@/components/profiles/ProfileModal.vue";
import serverPagination from "~/components/app/serverPagination";

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
    ProfileModal,
  },

  data() {
    return {
      controller: "profile",
      modals: {
        form: false,
        profile: {},
      },
    };
  },
  methods: {
    OpenModalForm(row, mode) {
      this.modals.mode = mode;
      this.modals.item = row;
      this.modals.tableData = this.tableData;
      this.modals.form = true;
    },
  },
};
</script>
