 <template>
<header>
<navbar class="stylish-color" position="top" dark>
  <mdb-navbar-brand>
    <router-link v-if="this.vetUser && isLoggedIn" to="/home_vet" class="brand-logo">Pet Medic</router-link>
    <router-link v-if="this.ownerUser && isLoggedIn" to="/home_owner" class="brand-logo">Pet Medic</router-link>
    <router-link v-if="!isLoggedIn" to="/login" class="brand-logo">Pet Medic</router-link>
  </mdb-navbar-brand>
  <navbar-collapse>
    <navbar-nav>
      <!-- left -->
      <navbar-item><router-link to="/home_page">Home</router-link></navbar-item>
      <navbar-item><router-link to="/contact">Contact</router-link></navbar-item>
    </navbar-nav>
      <!-- right -->
      <navbar-nav right>
    <form class="form-inline">
      <!-- <input class="form-control p-2" type="text" placeholder="Search" aria-label="Search" style="margin-right:10px;"> -->
      <vue-bootstrap-typeahead v-model="query" id="search" :data="['Canada', 'USA', 'Mexico']" placeholder="Search" style="margin-right:10px;"/>
      <!-- <h1 style="color:white">{{query}}</h1> -->
    <navbar-item v-if="!isLoggedIn"><router-link to="/login">Login</router-link></navbar-item>
    <navbar-item v-if="!isLoggedIn"><router-link to="/register">Register</router-link></navbar-item>
      <dropdown v-if="isLoggedIn" tag="li" class="nav-item dropdown-custom symbol-custom">
        <dropdown-toggle tag="a" navLink color="gray" slot="toggle" waves-fixed><span class="email white-text">{{currentUser}}</span></dropdown-toggle>
        <dropdown-menu right>
          <dropdown-item v-if="this.vetUser"><router-link to="/home_vet">Dashboard</router-link></dropdown-item>
          <dropdown-item v-if="this.ownerUser"><router-link to="/home_owner">Dashboard</router-link></dropdown-item>
          <dropdown-item v-if="this.vetUser"><router-link to="/medic">My Pet Record</router-link></dropdown-item>
          <dropdown-item v-if="this.ownerUser"><router-link to="/medic">My Pet Record</router-link></dropdown-item>
          <dropdown-item v-if="this.ownerUser || this.vetUser"><router-link to="/friend">Friend</router-link></dropdown-item>
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
      currentUser: false,
      ownerUser: null,
      vetUser: null,
      query: null//localStorage.getItem("search_text")
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
          localStorage.removeItem("ownerUser");
          localStorage.removeItem("vetUser");
          // location.href = "/home_page";
          this.$router.go({ path: this.$router.path });
        });
    }
  },
  mounted() {
    if (firebase.auth().currentUser) {
      this.isLoggedIn = true;
      this.currentUser = firebase.auth().currentUser.email;
      this.ownerUser = JSON.parse(localStorage.getItem("ownerUser"));
      this.vetUser = JSON.parse(localStorage.getItem("vetUser"));
    }
        document.getElementById('search').addEventListener('keypress', function(event) {
          var key = event.which || event.keyCode;
          if(key == 13){
            // alert("enter"+event.target.value)
            event.preventDefault();
            localStorage.setItem("search_text", event.target.value)
            location.href = "/search_result"
          }
    });
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
  margin-left: 0em;
}
.symbol-custom {
  color: white !important;
}

/*Samsung Galaxy S5 and iPhone 5 Portrait*/
@media only screen and (max-width: 360px) and (max-height: 640px) and (orientation: portrait) {
  .form-inline{
      margin-right: 70px;
  }
}

</style>

