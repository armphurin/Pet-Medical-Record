import Vue from "vue";
import Router from "vue-router";
import HomeOwner from "@/components/HomeOwner";
import HomeVet from "@/components/HomeVet";
import ViewPet from "@/components/ViewPet";
import NewPet from "@/components/NewPet";
import EditPet from "@/components/EditPet";
import Login from "@/components/Login";
import Register from "@/components/Register";
import firebase from "firebase";
import db from "../components/firebaseInit";
import ViewProfile from "@/components/ViewProfile";
import EditProfile from "@/components/EditProfile";
import HomeProfile from "@/components/HomeProfile";
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

Vue.use(Router, axios, VueAxios, Datetime, VueSweetalert2);

let router = new Router({
  routes: [
    // {
    //   path: "/",
    //   name: "home-owner",
    //   component: HomeOwner,
    //   meta: {
    //     requiresAuth: true,
    //     requiresOwner: true
    //   }
    // },
    {
      path: "/",
      name: "home-vet",
      component: HomeVet,
      meta: {
        requiresAuth: true,
        requiresVet: true
      }
    },
    {
      path: "/login",
      name: "login",
      component: Login,
      meta: {
        requiresGuest: true
      }
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
      path: "/new",
      name: "new-pet",
      component: NewPet,
      meta: {
        requiresAuth: true
      }
    },
    {
      path: "/edit/:pet_id",
      name: "edit-pet",
      component: EditPet,
      meta: {
        requiresAuth: true
      }
    },
    {
      path: "/pet/:pet_id",
      name: "view-pet",
      component: ViewPet,
      meta: {
        requiresAuth: true
      }
    },
    {
      path: "/profile/:profile_id",
      name: "view-profile",
      component: ViewProfile,
      meta: {
        requiresAuth: true
      }
    },
    {
      path: "/edit/:profile_id",
      name: "edit-profile",
      component: EditProfile,
      meta: {
         requiresAuth: true
      }
    },
    {
      path: "/home_profile",
      name: "home-profile",
      component: HomeProfile,
      meta: {
         requiresAuth: true
      }
    },
    {
      path: "/home_page",
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
      path: "/pre_load",
      name: "pre-load",
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

  ]
});

// Nav Guard
router.beforeEach((to, from, next) => {
  // Check for requiresAuth guard
  if (to.matched.some(record => record.meta.requiresAuth)) {
    // Check if NO logged user
    if (!firebase.auth().currentUser) {
      // Go to login
      next({
        path: "/login",
        query: {
          redirect: to.fullPath
        }
      });
    } else {
      // Proceed to route
      next();
    }
  } else if (to.matched.some(record => record.meta.requiresGuest)) {
    // Check if NO logged user
    if (firebase.auth().currentUser) {
      // Go to login
      next({
        path: "/",
        query: {
          redirect: to.fullPath
        }
      });
    } else {
      // Proceed to route
      next();
    }
  } else {
    // Proceed to route
    next();
  }
});

export default router;
