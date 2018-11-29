import Vue from "vue";
import Router from "vue-router";
import HomeOwner from "@/components/HomeOwner";
import HomeVet from "@/components/HomeVet";
import Login from "@/components/Login";
import Register from "@/components/Register";
import firebase from "firebase";
import HomePage from "@/components/HomePage";
import RegisterOwner from "@/components/RegisterOwner";
import RegisterVet from "@/components/RegisterVet";
import Contact from "@/components/Contact";
import Medic from "@/components/Medic";
import axios from "axios";
import VueAxios from "vue-axios";
import Datetime from "vue-datetime";
// You need a specific loader for CSS files
import "vue-datetime/dist/vue-datetime.css";
import VueSweetalert2 from "vue-sweetalert2";
import vSelect from 'vue-select';
import VueBootstrapTypeahead from 'vue-bootstrap-typeahead'

// Global registration
Vue.component('vue-bootstrap-typeahead', VueBootstrapTypeahead)
Vue.use(Router, axios, VueAxios, Datetime, VueSweetalert2);
Vue.component('v-select', vSelect)

let router = new Router({
  routes: [
    {
      path: "/home_owner",
      name: "home-owner",
      component: HomeOwner,
      meta: {
        requiresAuth: true,
        requiresOwner: true,
        requiresGuest: false
      }
    },
    {
      path: "/home_vet",
      name: "home-vet",
      component: HomeVet,
      meta: {
        requiresAuth: true,
        requiresVet: true,
        requiresGuest: false
      }
    },
    {
      path: "/login",
      name: "login",
      component: Login,
      meta: {
        requiresGuest: true
      },
      props: true
    },
    {
      path: "/register",
      name: "register",
      component: Register,
      meta: {
        requiresGuest: true
      }
    },
    {
      path: "/home_page",
      name: "home-page",
      component: HomePage,
      meta: {}
    },
    {
      path: "/",
      name: "home-page",
      component: HomePage,
      meta: {}
    },
    {
      path: "/register_owner",
      name: "register-owner",
      component: RegisterOwner,
      meta: {
        requiresGuest: true
      }
    },
    {
      path: "/register_vet",
      name: "register-vet",
      component: RegisterVet,
      meta: {
        requiresGuest: true
      }
    },
    {
      path: "/contact",
      name: "contact",
      component: Contact,
      meta: {}
    },
    {
      path: "/medic",
      name: "medic",
      component: Medic,
      meta: { requiresAuth: true }
    }
  ],
  mode: "history"
});

// Nav Guard
router.beforeEach((to, from, next) => {
  // Check for requiresAuth guard
  if (to.matched.some(record => record.meta.requiresAuth)) {
    // Check if NO logged user
    if (!firebase.auth().currentUser) {
      // Go to login
      console.log("check if auth");
      next({
        path: "/",
        query: {
          redirect: to.fullPath
        }
      });
    } else {
      // Proceed to route
      console.log("check else auth");
      next();
    }
  } else if (to.matched.some(record => record.meta.requiresGuest)) {
    // Check if NO logged user
    if (firebase.auth().currentUser) {
      // Go to login
      next();
      // next({
      //   path: "/",
      //   query: {
      //     redirect: to.fullPath
      //   }
      // });
    } else {
      // Proceed to route
      console.log("check else guest");
      next();
    }
  } else {
    // Proceed to route
    console.log("check other");
    next();
  }
});

export default router;
