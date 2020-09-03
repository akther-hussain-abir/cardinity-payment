let cart = window.localStorage.getItem('cart');
let cartCount = window.localStorage.getItem('cartCount');
let orderSubtotal = window.localStorage.getItem('orderSubtotal');
let order = window.localStorage.getItem('order');

let store = {
    state: {
        products: [],
        cart: cart ? JSON.parse(cart) : [],
        cartCount: cartCount ? parseInt(cartCount) : 0,
        cartIsOpen: false,
        orderSubtotal: orderSubtotal ? parseFloat(orderSubtotal).toFixed(2) : 0,
        order: order ? JSON.parse(order) : null
    },

    mutations: {
        SYNC_PRODUCTS(state, data) {
            if (data) {
                state.products = data;
                state.cartIsOpen = true;
            } else {
                state.products = null;
            }
        },
        addToCart(state, item) {
            let found = state.cart.find(product => product.id == item.id);

            if (found) {
                if (found.quantity && found.quantity < 2) {
                    found.quantity++;
                    found.totalPrice = found.quantity * found.price;   
                    state.cartCount++;
                }                
            } else {
                state.cart.push(item);
                state.cartCount++;

                Vue.set(item, 'quantity', 1);
                Vue.set(item, 'totalPrice', item.price);
            }
            
            this.commit('saveCart');
        },

        removeFromCart(state, productId) {
            const indexToRemove = state.cart.findIndex(
                item => item.id === productId,
            );
            state.cart.splice(indexToRemove, 1);
            this.commit('saveCart');
        },

        saveCart(state) {
            window.localStorage.setItem('cart', JSON.stringify(state.cart));
            window.localStorage.setItem('cartCount', state.cartCount);
        },

        SAVE_ORDER_RESPONSE(state, payload) {
            if (payload.status === 'success' && payload.data) {
                state.orderSubtotal = parseFloat(payload.data.amount).toFixed(2);
                window.localStorage.setItem('order', JSON.stringify(payload.data));
                window.localStorage.setItem('orderSubtotal', parseFloat(payload.data.amount).toFixed(2));               
            }
        },

        CONFIRM_ORDER_PAYMENT(state, payload) {
            // console.log(payload)
        },
    },
    actions: {
        async syncProducts({ commit }) {
            await axios.get("/api/products").then((response) => {
                this.products = response.data.data;
                commit('SYNC_PRODUCTS', this.products);
            });
        },
        async saveOrder({commit}, order) {
            await axios.post('/api/order/place_order', order)
                .then(res => {
                    commit('SAVE_ORDER_RESPONSE', res.data);
                }).catch(err => {
                console.log(err)
            })

        },
        async processPayment({ commit }, payload) {
            await axios.post('/api/order/process_payment', payload)
                .then(res => {
                    commit('CONFIRM_ORDER_PAYMENT', res.data);
                }).catch(err => {
                    console.log(err)
                })

        },
    },
    getters: {
         order(state) {
            function createOrderItem(item) {
                return {
                    quantity: item.quantity,
                    product: state.cart.find(p => p.id === item.id),
                };
            }

            return state.cart.map(item =>
                createOrderItem(item),
            );
        },

        totalQuantity(state) {
            return state.cart
            .reduce((previous, current) => previous + current.quantity, 0);
        },
        subtotal(state) {        
            if (state.cartIsOpen) {
                return state.cart
                .reduce(
                    (previous, current) => {                    
                        const price = state.products
                            .find(item => item.id === current.id)
                            .price;
                                          
                        const totalPrice = price * current.quantity;                        
                        return previous + totalPrice;
                    },
                    0,
                );                
            } else {
                return 0;
            }
        },
        carttotal(state) {        
            return state.cart
                .reduce(
                    (previous, current) => {                                                                                     
                        const totalPrice = current.price * current.quantity;                        
                        return previous + totalPrice;
                    },
                    0,
                );       
        },
    }
};

export default store;