<template>
  <div class="w-full flex flex-col shadow-lg p-2">
    <div class="bg-blue-300 relative mb-2 text-center">
      <h2 class="uppercase font-normal tracking-wide inline-block py-2">My Cart</h2>
    </div>
    <div class="flex-1" v-if="productsAdded.length">
      <table class="table-auto text-xs md:text-base" cellspacing="0">
        <thead>
          <tr class="h-12 uppercase text-xs">
            <th class="w-2/4 px-1 py-2 text-left">Name</th>
            <th class="w-1/4 px-1 py-2 text-center">
              <span class="lg:hidden" title="Quantidade">Qty</span>
              <span class="hidden lg:inline">Qty</span>
            </th>
            <th class="w-1/2 px-1 py-2 text-right">Price</th>
          </tr>
        </thead>
        <tbody>
          <tr
            v-for="item in order"
            :key="item.product.id"
            class="h-12 text-xs border-t-2 border-gray-300"
          >
            <td width="65%">
              <p class="mb-2">{{ item.product.name }}</p>
              <button class="text-grey-lighter" @click="removeItem(item.product.id)">
                <small class="text-red-400 text-xs">(remove)</small>
              </button>
            </td>
            <td width="10%" class="text-center">{{ item.quantity }}</td>
            <td
              width="20%"
              class="text-right font-semibold"
            >{{ formatPrice(item.product.price * item.quantity) }}</td>
          </tr>
        </tbody>
        <tfoot>
          <tr class="h-24">
            <th class="text-left border-t uppercase">Subtotal</th>
            <td colspan="2" class="text-right border-t">EUR {{ formatPrice(subtotal) }}</td>
          </tr>
        </tfoot>
      </table>

      <div class="flex items-center justify-content-around" v-if="productsAdded.length">
        <button
          class="bg-blue hover:bg-blue-500 text-white-700 font-semibold hover:text-white py-2 px-4 border border-blue-500 hover:border-transparent rounded"
          @click="processedToBuy()"
        >Buy</button>
      </div>
    </div>
    <p class="flex items-center justify-content-around mt-5" v-else>Cart is empty</p>
  </div>
</template>

<script>
var priceMixin = {
  methods: {
    formatPrice(price) {
      return parseFloat(price).toFixed(2);
    },
  },
};

export default {
  name: "cart",
  mixins: [priceMixin],
  computed: {
    isOpen() {
      return this.$store.state.cartIsOpen;
    },

    productsAdded() {
      return this.$store.state.cart;
    },

    order() {
      return this.$store.getters.order;
    },

    subtotal() {
      return this.$store.getters.subtotal;
    },
  },
  methods: {
    closeCart() {
      this.$store.commit("closeCart");
    },

    removeItem(id) {
      this.$store.commit("removeFromCart", id);
    },

    processedToBuy() {
      let payload = {
        items: this.order,
        subtotal: this.subtotal,
      };
      this.$store.dispatch("saveOrder", payload);
      window.location = "order/checkout";
    },
  },
};
</script>