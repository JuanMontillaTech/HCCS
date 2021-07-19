export default {
  data() {
    return {
      filterUrl: "",
      items: [],
      loading: false,
      selectedItemId: "",
      selectedItem: {},
    }
  },
  methods: {
    filter(query) {
      if (query !== "") {
        this.loading = true;
        setTimeout(() => {
          this.serverSearch(query);
        }, 500);
      } else {
        this.items = [];
      }
    },
    serverSearch(search) {
      this.$axios
        .$get(`/${this.filterUrl}?search=${search}`)
        .then((res) => {
          this.items = res;
          this.loading = false;
        }).catch(res => {
        });;
    },
    selectedChanged(e) {
      const filterItems = this.items.filter(x => x.id == e);
      if (filterItems.length > 0) {
        this.selectedItem = filterItems[0];
      }
    }
  }
}