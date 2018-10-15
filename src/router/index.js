import Vue from 'vue';
import Router from 'vue-router';
import Home from '@/components/Home';
import ViewPet from '@/components/ViewPet';
import NewPet from '@/components/NewPet';
import EditPet from '@/components/EditPet';
import Login from '@/components/Login';
import Register from '@/components/Register';
import firebase from 'firebase';
import ViewProfile from '@/components/ViewProfile'
import EditProfile from '@/components/EditProfile'
import HomeProfile from '@/components/HomeProfile'
import HomePage from '@/components/HomePage'
import RegisterOwner from '@/components/RegisterOwner'
import RegisterVet from '@/components/RegisterVet'

Vue.use(Router);

let router = new Router({
  routes: [
    {
      path: '/',
      name: 'Home',
      component: Home,
      meta: {
        requiresAuth: true
      }
    },
    {
      path: '/login',
      name: 'login',
      component: Login,
      meta: {
        requiresGuest: true
      }
    },
    {
      path: '/register',
      name: 'register',
      component: Register,
      meta: {
        requiresGuest: true
      }
    },
    {
      path: '/new',
      name: 'new-pet',
      component: NewPet,
      meta: {
        requiresAuth: true
      }
    },
    {
      path: '/edit/:pet_id',
      name: 'edit-pet',
      component: EditPet,
      meta: {
        requiresAuth: true
      }
    },
    {
      path: '/pet/:pet_id',
      name: 'view-pet',
      component: ViewPet,
      meta: {
        requiresAuth: true
      }
    },
    {
      path: '/profile/:profile_id',
      name: 'view-profile',
      component: ViewProfile,
      meta: {
        requiresAuth: true
      }
    },
    {
      path: '/edit/:profile_id',
      name: 'edit-profile',
      component: EditProfile,
      meta: {
        requiresAuth: true
      }
    },
    {
      path: '/home_profile',
      name: 'home-profile',
      component: HomeProfile,
      meta: {
        requiresAuth: true
      }
    },
    {
      path: '/home_page',
      name: 'home-page',
      component: HomePage,
      meta: {
        requiresGuest: true
      }
    },
    {
      path: '/register_owner',
      name: 'register-owner',
      component: RegisterOwner,
      meta: {
        requiresGuest: true
      }
    },
    {
      path: '/register_vet',
      name: 'register-vet',
      component: RegisterVet,
      meta: {
        requiresGuest: true
      }
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
        path: '/login',
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
        path: '/',
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
