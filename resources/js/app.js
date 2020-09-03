/**
 * First we will load all of this project's JavaScript dependencies which
 * includes Vue and other libraries. It is a great starting point when
 * building robust, powerful web applications using Vue and Laravel.
 */

require('./bootstrap');
import store from './store.js';

window.Vue = require('vue');
Vue.use(Vuex);


Vue.component('products-component', require('./components/ProductsComponent.vue').default);
Vue.component('checkout-component', require('./components/CheckoutComponent.vue').default);
Vue.component('product-component', require('./components/Product.vue').default);
Vue.component('Cart', require('./components/Cart.vue').default);


const app = new Vue({
    el: '#app',
    store: new Vuex.Store(store)
});
