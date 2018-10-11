<template>

  <!-- <div>
    <div class="container">
    <div class="row">
      <div class="col s12 m8 offset-m2">
        <div class="login card-panel green white-text center">
          <h3>Login</h3>
          <form action="index.html">
            <div class="input-field">
              <i class="material-icons prefix">email</i>
              <input type="email" id="email" v-model="email">
              <label class="white-text" for="email">Email Address</label>
            </div>
            <div class="input-field">
              <i class="material-icons prefix">lock</i>
              <input type="password" id="password" v-model="password">
              <label class="white-text" for="password">Password</label>
            </div>
            <button v-on:click="login" class="btn btn-large btn-extended grey lighten-4 black-text">Login</button>
          </form>
        </div>
      </div>
    </div>
  </div>
  </div> -->


<!-- <div class="container">
  <div class="row">
    <div class="col-sm-4" style="text-align:center;">
      Lay 1
    </div>
    <div class="col-sm-4" style="text-align:center;">
      Lay 2
    </div>
    <div class="col-sm-4" style="text-align:center;">
      Lay 3
    </div>
  </div>
</div> -->

  <div class="wrapper">
    <view-wrapper>
        <container class="px-md-3 px-sm-0">
          <form action="index.html">
          <row>
            <column md="12" class="mb-4 white-text text-center">
              <h3 class="display-3 font-weight-bold mb-0 pt-md-5">Pet Medic</h3>
              <hr class="hr-light my-4 w-75"/>
              <input class="form-control form-control-lg" type="email" placeholder="email" id="email" v-model="email" style="width:300px;margin: 0 auto;border-radius: 13px;">
            </column>
            <column md="12" class="mb-4 white-text text-center">
              <input class="form-control form-control-lg" type="password" placeholder="password" id="password" v-model="password" style="width:300px;margin: 0 auto;border-radius: 13px;">
            </column>
            <column md="12" class="mb-4 white-text text-center">
              <!-- <btn v-on:click="login" type="button" color="elegant" style="width:300px;margin: 0 auto;border-radius: 13px;">Login</btn> -->
              <button v-on:click="login" class="btn btn-elegant" style="width:300px;margin: 0 auto;border-radius: 13px;">Login</button>
            </column>
          </row>
          </form>
        </container>
    </view-wrapper>

<ul class="bg-bubbles">
		<li></li>
		<li></li>
		<li></li>
		<li></li>
		<li></li>
		<li></li>
		<li></li>
		<li></li>
		<li></li>
		<li></li>
	</ul>

  </div>

</template>

<script>
import {
  Container,
  Row,
  Column,
  Navbar,
  NavbarCollapse,
  NavbarNav,
  NavbarItem,
  mdbInput,
  ViewWrapper,
  MdMask,
  Btn,
  mdbNavbarBrand
} from "mdbvue";

import firebase from "firebase";
export default {
  name: "login",
  components: {
    Container,
    Row,
    Column,
    Navbar,
    NavbarCollapse,
    NavbarNav,
    NavbarItem,
    mdbInput,
    ViewWrapper,
    MdMask,
    Btn,
    mdbNavbarBrand
  },
  data: function() {
    return {
      email: "",
      password: ""
    };
  },
  methods: {
    login: function(e) {
      firebase
        .auth()
        .signInWithEmailAndPassword(this.email, this.password)
        .then(
          user => {
            alert(`You are logged in as ${user.email}`);
            this.$router.go({ path: this.$router.path });
          },
          err => {
            alert(err.message);
          }
        );
      e.preventDefault();
    }
  }
};
</script>

<style>
html {
  height: 100%;
  width: 100%;
  -webkit-background-size: cover;
  -moz-background-size: cover;
  -o-background-size: cover;
  background-size: cover;
  background-repeat: no-repeat;
  background-position: center;
  background-attachment: fixed;
  background: rgb(52, 160, 217); /* Old browsers */
  background: -moz-linear-gradient(
    top,
    rgb(52, 160, 217) 0%,
    rgb(23, 169, 149) 56%,
    rgb(23, 169, 149) 100%
  ); /* FF3.6-15 */
  background: -webkit-linear-gradient(
    top,
    rgb(52, 160, 217) 0%,
    rgb(23, 169, 149) 56%,
    rgb(23, 169, 149) 100%
  ); /* Chrome10-25,Safari5.1-6 */
  background: linear-gradient(
    to bottom,
    rgb(52, 160, 217) 0%,
    rgb(23, 169, 149) 56%,
    rgb(23, 169, 149) 100%
  ); /* W3C, IE10+, FF16+, Chrome26+, Opera12+, Safari7+ */
  filter: progid:DXImageTransform.Microsoft.gradient( startColorstr='#34a0d9', endColorstr='#17a995',GradientType=0 ); /* IE6-9 */
}
body {
  background-color: transparent;
}


.bg-bubbles {
  position: absolute;
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
  z-index: 1;
}
.bg-bubbles li {
  position: absolute;
  list-style: none;
  display: block;
  width: 40px;
  height: 40px;
  background-color: rgba(255, 255, 255, 0.15);
  bottom: -160px;
  -webkit-animation: square 25s infinite;
  animation: square 25s infinite;
  transition-timing-function: linear;
}
.bg-bubbles li:nth-child(1) {
  left: 10%;
}
.bg-bubbles li:nth-child(2) {
  left: 20%;
  width: 40px;
  height: 40px;
  -webkit-animation-delay: 2s;
          animation-delay: 2s;
  -webkit-animation-duration: 17s;
          animation-duration: 17s;
}
.bg-bubbles li:nth-child(3) {
  left: 25%;
  -webkit-animation-delay: 4s;
          animation-delay: 4s;
}
.bg-bubbles li:nth-child(4) {
  left: 40%;
  width: 30px;
  height: 30px;
  -webkit-animation-duration: 22s;
          animation-duration: 22s;
  background-color: rgba(255, 255, 255, 0.25);
}
.bg-bubbles li:nth-child(5) {
  left: 70%;
}
.bg-bubbles li:nth-child(6) {
  left: 80%;
  width: 60px;
  height: 60px;
  -webkit-animation-delay: 3s;
          animation-delay: 3s;
  background-color: rgba(255, 255, 255, 0.2);
}
.bg-bubbles li:nth-child(7) {
  left: 32%;
  width: 80px;
  height: 80px;
  -webkit-animation-delay: 7s;
          animation-delay: 7s;
}
.bg-bubbles li:nth-child(8) {
  left: 55%;
  width: 20px;
  height: 20px;
  -webkit-animation-delay: 15s;
          animation-delay: 15s;
  -webkit-animation-duration: 40s;
          animation-duration: 40s;
}
.bg-bubbles li:nth-child(9) {
  left: 25%;
  width: 10px;
  height: 10px;
  -webkit-animation-delay: 2s;
          animation-delay: 2s;
  -webkit-animation-duration: 40s;
          animation-duration: 40s;
  background-color: rgba(255, 255, 255, 0.3);
}
.bg-bubbles li:nth-child(10) {
  left: 90%;
  width: 80px;
  height: 80px;
  -webkit-animation-delay: 11s;
          animation-delay: 11s;
}
@-webkit-keyframes square {
  0% {
    -webkit-transform: translateY(0);
            transform: translateY(0);
  }
  100% {
    -webkit-transform: translateY(-300px) rotate(600deg);
            transform: translateY(-300px) rotate(600deg);
  }
}
@keyframes square {
  0% {
    -webkit-transform: translateY(0);
            transform: translateY(0);
  }
  100% {
    -webkit-transform: translateY(-300px) rotate(600deg);
            transform: translateY(-300px) rotate(600deg);
  }
}

.wrapper {
  position: absolute;
  top: 50%;
  left: 0;
  width: 100%;
  height: 100%;
  margin-top: -200px;
  overflow: hidden;
}

form {
  position: relative;
  z-index: 2;
}
</style>
