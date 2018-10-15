 <template>
 
  <!-- <nav>
      <div class="nav-wrapper green">
        <div class="container">
          <router-link to="/" class="brand-logo">Pet Medic</router-link>    
          <a href="#" data-activates="mobile-demo" class="button-collapse"><i class="material-icons">menu</i></a>
          <ul class="right hide-on-med-and-down">
            <li v-if="isLoggedIn"><span class="email black-text">{{currentUser}}</span></li>
            <li v-if="isLoggedIn"><router-link to="/">All Pet</router-link></li>
            <li v-if="isLoggedIn"><router-link to="/home_profile">All Profile</router-link></li>
            <li v-if="!isLoggedIn"><router-link to="/login">Login</router-link></li>
            <li v-if="!isLoggedIn"><router-link to="/register">Register</router-link></li>
             <li v-if="isLoggedIn"><button v-on:click="logout" class="btn black">Logout</button></li>
             
          </ul>
          <ul class="side-nav" id="mobile-demo">
            <li v-if="isLoggedIn"><router-link to="/">All Pet</router-link></li>
            <li v-if="isLoggedIn"><router-link to="/profile">All Profile</router-link></li>
            <li v-if="!isLoggedIn"><router-link to="/login">Login</router-link></li>
            <li v-if="!isLoggedIn"><router-link to="/register">Register</router-link></li>
            <li><a href="#" class="divider"></a></li>
             <li v-if="isLoggedIn"><button v-on:click="logout" class="btn">Logout</button></li>
           
          </ul>
        </div>
      </div>
    </nav> -->

    
<header>
<navbar class="stylish-color" dark>
  <mdb-navbar-brand>
    <router-link to="/" class="brand-logo">Pet Medic</router-link>
  </mdb-navbar-brand>
  <navbar-collapse>
    <navbar-nav>
      <navbar-item v-if="!isLoggedIn"><router-link to="/home_page">Home</router-link></navbar-item>
      <navbar-item v-if="!isLoggedIn">Contact</navbar-item>
      <navbar-item v-if="!isLoggedIn"><router-link to="/login">Login</router-link></navbar-item>
      <navbar-item v-if="!isLoggedIn"><router-link to="/register">Register</router-link></navbar-item>
      <navbar-item v-if="isLoggedIn"><router-link to="/">All Pet</router-link></navbar-item>
      <navbar-item v-if="isLoggedIn"><router-link to="/home_profile">All Profile</router-link></navbar-item>
      <dropdown v-if="isLoggedIn" tag="li" class="nav-item">
        <dropdown-toggle tag="a" navLink color="indigo" slot="toggle" waves-fixed><span class="email black-text">{{currentUser}}</span></dropdown-toggle>
        <dropdown-menu>
          <dropdown-item><router-link to="/home_profile">My Profile</router-link></dropdown-item>
          <dropdown-item><router-link to="/">My Pet</router-link></dropdown-item>
          <dropdown-item><button v-on:click="logout" class="btn">Logout</button></dropdown-item>
        </dropdown-menu>
      </dropdown>
    </navbar-nav>

    <form class="form-inline">
      <input class="form-control mr-auto p-2" type="text" placeholder="Search" aria-label="Search">
    </form>
  </navbar-collapse>
</navbar>
</header>

 </template>

<script>

import firebase from 'firebase';
import { Navbar, NavbarItem, NavbarNav, NavbarCollapse, mdbNavbarBrand, Dropdown, DropdownItem, DropdownMenu, DropdownToggle } from 'mdbvue';
export default {
  name: 'navbar2',
  components: {Navbar, NavbarItem, NavbarNav, NavbarCollapse, mdbNavbarBrand, Dropdown, DropdownItem, DropdownMenu, DropdownToggle },
  data() {
    return {
      isLoggedIn: false,
      currentUser: false
    };
  },
  created() {
    if (firebase.auth().currentUser) {
      this.isLoggedIn = true;
      this.currentUser = firebase.auth().currentUser.email;
    }
  },
  methods: {
    logout: function() {
      firebase
        .auth()
        .signOut()
        .then(() => {
          this.$router.go({ path: this.$router.path });
        });
    }
  }
};
</script>

<style scoped>
.email {
  padding-right: 10px;
}
header {
  position: relative;
  z-index: 5;
}
a{
  color: white;
}
</style>

