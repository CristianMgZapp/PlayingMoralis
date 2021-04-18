import Vue from 'vue'
import Router from 'vue-router'
import Customers from './views/Customers.vue'

Vue.use(Router)

const router =  new Router({
  routes: [
    {
      path: '/',
      redirect: '/customers'
    },
    {
      path: '/customers',
      name: 'customers',
      component: Customers
    },
  ]
})
export default router
