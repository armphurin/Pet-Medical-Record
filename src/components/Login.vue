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

  <div>
    <view-wrapper>
        <container class="px-md-3 px-sm-0">
          <row>
            <column md="12" class="mb-4 white-text text-center">
              <h3 class="display-3 font-weight-bold mb-0 pt-md-5">Login</h3>
              <hr class="hr-light my-4 w-75"/>
              <h4 class="subtext-header mt-2 mb-4">Lorem ipsum dolor sit amet, consectetur adipisicing elit deleniti consequuntur nihil.</h4>
              <btn outline="white" rounded color="white"><fa icon="home"/> Visit us</btn>
            </column>
          </row>
        </container>
    </view-wrapper>

  </div>

</template>

<script>
import { Container, Row, Column, Navbar, NavbarCollapse, NavbarNav, NavbarItem, mdbInput, ViewWrapper, MdMask, Btn, mdbNavbarBrand } from 'mdbvue';

import firebase from 'firebase';
export default {
  name: 'login',
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
      email: '',
      password: ''
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
html{
  background-size: cover;
  height: 100%;
  -webkit-background-size: cover;
  -moz-background-size: cover;
  -o-background-size: cover;
  background-size: cover;
  background-repeat:no-repeat;
  background: rgb(52,160,217); /* Old browsers */
  background: -moz-linear-gradient(top, rgb(52,160,217) 0%, rgb(23,169,149) 56%, rgb(23,169,149) 100%); /* FF3.6-15 */
  background: -webkit-linear-gradient(top, rgb(52,160,217) 0%,rgb(23,169,149) 56%,rgb(23,169,149) 100%); /* Chrome10-25,Safari5.1-6 */
  background: linear-gradient(to bottom, rgb(52,160,217) 0%,rgb(23,169,149) 56%,rgb(23,169,149) 100%); /* W3C, IE10+, FF16+, Chrome26+, Opera12+, Safari7+ */
  filter: progid:DXImageTransform.Microsoft.gradient( startColorstr='#34a0d9', endColorstr='#17a995',GradientType=0 ); /* IE6-9 */
}
body { 
    background-color: transparent;
}
</style>
