<template>
  <div class="w-full">
    <div class="card flex flex-col justify-center p-3 bg-white rounded-lg shadow-md mb-2" v-for="product in product_list" :key="product.id">
        <div class="prod-title">
            <p class="text-md uppercase text-gray-900 font-bold">{{ product.name }}</p>
            <p class="uppercase text-xs text-gray-400">
                <span v-if="product.description">{{product.description}}</span>
                <span v-if="!product.description">Lorem ipsum dolor sit amet consectetur adipisicing elit. Ad maxime harum nostrum animi unde</span>
            </p>
        </div>      
        <div class="prod-info grid gap-10 mt-2">        
            <div class="flex flex-row md:flex-row justify-between items-center text-gray-900">
            <p class="font-bold text-md">{{ product.price }} euro</p>
            <button class="transition ease-in duration-200 uppercase rounded-full hover:bg-gray-800 hover:text-white border-2 border-gray-900 focus:outline-none text-md hover:cursor-default text-2xl w-12 h-12" @click="addToCart(product)">+</button>
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
  created() {
      this.getProducts();
  },
  computed: {
    product_list() {
      return this.$store.state.products;
    }
  },
  methods: {
    getProducts() {
      this.$store.dispatch('syncProducts');
    },

    addToCart(item) {
        this.$store.commit('addToCart', item);
    }
  },
};
</script>