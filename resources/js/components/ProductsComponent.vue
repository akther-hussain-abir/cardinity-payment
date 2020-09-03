<template>
  <div class="col-8">
    <div class="row">
      <div class="col-sm-6" v-for="product in products" :key="product.id">
        <div class="card">
          <div class="card-body">
            <h5 class="card-title">{{ product.name }}</h5>
            <p class="card-text">{{ product.price }}</p>
            <button class="btn btn-sm btn-primary">Add to cart</button>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  data() {
    return {
      products: {},
    };
  },
  methods: {
    getProducts() {
      axios.get("/api/products").then((response) => {
        this.products = response.data.data;
      });
    },
  },
  created() {
    this.getProducts();
  },
};
</script>