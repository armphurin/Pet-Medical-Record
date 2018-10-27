 <template>
<header>
<navbar class="stylish-color" position="top" dark>
  <mdb-navbar-brand>
    <router-link to="/" class="brand-logo">Pet Medic</router-link>
  </mdb-navbar-brand>
  <navbar-collapse>
    <navbar-nav>
      <!-- left -->
      <navbar-item><router-link to="/home_page">Home</router-link></navbar-item>
      <navbar-item><router-link to="/contact">Contact</router-link></navbar-item>
    </navbar-nav>
      <!-- <navbar-item v-if="!isLoggedIn"><router-link to="/login">Login</router-link></navbar-item>
      <navbar-item v-if="!isLoggedIn"><router-link to="/register">Register</router-link></navbar-item> -->
      <!-- right -->
      <navbar-nav right>
    <form class="form-inline">
      <input class="form-control mr-auto p-2" type="text" placeholder="Search" aria-label="Search">
    <navbar-item v-if="!isLoggedIn"><router-link to="/login">Login</router-link></navbar-item>
    <navbar-item v-if="!isLoggedIn"><router-link to="/register">Register</router-link></navbar-item>
      <dropdown v-if="isLoggedIn" tag="li" class="nav-item dropdown-custom symbol-custom">
        <dropdown-toggle tag="a" navLink color="gray" slot="toggle" waves-fixed><span class="email white-text">{{currentUser}}</span></dropdown-toggle>
        <dropdown-menu right>
          <dropdown-item><router-link to="/">My Home</router-link></dropdown-item>
          <dropdown-item><router-link to="/home_profile">My Pet Record</router-link></dropdown-item>
          <div class="dropdown-divider"></div>
          <dropdown-item><btn @click="logout" class="btn btn-elegant">Logout</btn></dropdown-item>
        </dropdown-menu>
      </dropdown>
    </form>
    </navbar-nav>
  </navbar-collapse>
</navbar>
</header>

 </template>

<script>
import firebase from "firebase";
import {
  Navbar,
  NavbarItem,
  NavbarNav,
  NavbarCollapse,
  mdbNavbarBrand,
  Dropdown,
  DropdownItem,
  DropdownMenu,
  DropdownToggle
} from "mdbvue";
export default {
  name: "navbar2",
  components: {
    Navbar,
    NavbarItem,
    NavbarNav,
    NavbarCollapse,
    mdbNavbarBrand,
    Dropdown,
    DropdownItem,
    DropdownMenu,
    DropdownToggle
  },
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
  z-index: 10;
}
a {
  color: white;
}
.stylish-color {
  background-color: hsl(220, 33%, 11%, 0.6) !important;
}

.dropdown-custom {
  margin-left: 1em;
}
.symbol-custom {
  color: white !important;
}
</style>

