<template>
  <div class="grid grid-cols-1 overflow-hidden col-gap-6 mb-2">
    <div class="col-span-5">
      <div class="flex">
        <h6 class="text-sm font-semibold text-gray-800 flex-grow">{{ item.product.name }}</h6>
      </div>
      <p
        class="text-xs truncate text-gray-600"
        v-if="item.product.description"
      >{{item.product.description}}</p>
      <span class="text-sm text-gray-800">{{ item.quantity }} X {{ item.product.price }} EUR</span>
    </div>
  </div>
</template>

<script>
export default {
  name: "Item",
  props: {
    item: Object,
  },
};
</script>