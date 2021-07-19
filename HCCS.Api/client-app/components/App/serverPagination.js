export default {
  async created() {
    await this.changePage(1);
  },
  computed: {
    to() {
      let highBound = this.from + this.pagination.perPage;
      if (this.total < highBound) {
        highBound = this.total;
      }
      return highBound;
    },
    from() {
      return this.pagination.perPage * (this.pagination.currentPage - 1);
    },
    total() {
      return this.tableData.length;
    }
  },
  data() {
    return {
      pagination: {
        perPage: 5,
        currentPage: 0,
        perPageOptions: [5, 10, 25, 50],
        pageCount: 0,
        total: 0
      },
      tableData: [],
    }
  },
  methods: {
    changePage(item) {
      const url = `/${this.controller}?page=${item}&limit=${this.pagination.perPage}`;
      this.$axios.$get(url).then(res => {
        this.tableData = res.items;
        this.pagination.pageCount = res.totalPages;
        this.pagination.currentPage = res.currentPage;
        this.pagination.total = res.totalItems;
      });
    },
  },
}