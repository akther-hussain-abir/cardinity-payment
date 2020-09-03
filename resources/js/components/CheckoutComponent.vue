<template>
  <div
    :class="isCard ? '' : 'lg:h-screen'"
    class="container mx-auto p-6 grid grid-cols-1 row-gap-12 lg:grid-cols-10 lg:col-gap-10 lg:pt-12"
  >
    <Payment @handle-card="handleCard" @change-parent="handleAlert" :total="subtotal"></Payment>
    <Summary :items="order"></Summary>
    <Alert
      :visible="alertVisible"
      position="top-right"
      color="success"
      title="Success"
      description="Your payment has been successfully processed."
    />

    <Alert
      :visible="alertInvalidCartVisible"
      position="top-right"
      color="success"
      title="Success"
      description="Your payment has been successfully processed."
    />
  </div>
</template>

<script>
import Payment from "../components/Payment";
import Summary from "../components/Summary";
import Alert from "../components/Alert";

export default {
  name: "CheckoutPage",
  components: {
    Payment,
    Summary,
    Alert,
  },
  data() {
    return {
      alertVisible: false,
      alertInvalidCartVisible: false,
      total: 0,
      isCard: false,
    };
  },
  created() {
    this.checkValidData();
  },
  computed: {
    productsAdded() {
      return this.$store.state.cart;
    },

    order() {
      return this.$store.getters.order;
    },

    subtotal() {
      return parseFloat(this.$store.getters.carttotal).toFixed(2);
    },
  },
  methods: {
    checkValidData() {
      if (this.order && this.order.length === 0) {
        alertInvalidCartVisible = true;
        setTimeout(() => {
          this.alertInvalidCartVisible = false;
        }, 4000);
      }
    },
    handleAlert() {
      this.alertVisible = true;
      setTimeout(() => {
        this.alertVisible = false;
      }, 4000);
    },
    handleCard() {
      this.isCard = true;
    },
  },
};
</script>