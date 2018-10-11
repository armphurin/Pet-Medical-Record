<template>

  <div>
    <!--ViewWrapper-->
    <view-wrapper>
      <md-mask class="gradient d-flex justify-content-center align-items-center">
        <container>
          <row>
            <div class="white-text text-center text-md-left col-md-6 mt-xl-5 mb-5">
              <h1 class="h1-responsive font-weight-bold mt-sm-5">Make purchases with our app </h1>
              <hr class="hr-light"/>
              <h6 class="mb-4">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Rem repellendus quasi fuga nesciunt
              dolorum nulla magnam veniam sapiente, fugiat! Commodi sequi non animi ea dolor molestiae
              iste.</h6>
              <btn color="white">Download</btn>
              <btn outline="white">Learn More</btn>
            </div>
            <column md="6" xl="5" class="mt-xl-5">
              <img src="https://mdbootstrap.com/img/Mockups/Transparent/Small/admin-new.png" class="img-fluid"/>
            </column>
          </row>
        </container>
      </md-mask>
    </view-wrapper>
    <!--/.ViewWrapper-->

  </div>

</template>

<script>
import { Container, Row, Column, Navbar, NavbarCollapse, NavbarNav, NavbarItem, mdbInput, ViewWrapper, MdMask, Btn, mdbNavbarBrand } from 'mdbvue';

import firebase from 'firebase';
export default {
  name: 'homepage',
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

.navbar {
  transition: 1s;
}
.navbar .md-form {
  margin: 0;
}
.top-nav-collapse {
  background-color: #424f95 !important;
}
@media (max-width: 990px){
  .navbar {
    background-color: #424f95 !important;
  }
}
.view {
  background-image: url('https://mdbootstrap.com/img/Photos/Others/architecture.jpg');
  background-repeat: no-repeat;
  background-size: cover;
  background-position: center center;
  height: calc(100vh - 60px);
}
.gradient {
  background: -moz-linear-gradient(45deg, rgba(42, 27, 161, 0.7), rgba(29, 210, 177, 0.7) 100%);
  background: -webkit-linear-gradient(45deg, rgba(42, 27, 161, 0.7), rgba(29, 210, 177, 0.7) 100%);
  background: -webkit-gradient(linear, 45deg, from(rgba(42, 27, 161, 0.7)), to(rgba(29, 210, 177, 0.7)));
  background: -o-linear-gradient(45deg, rgba(42, 27, 161, 0.7), rgba(29, 210, 177, 0.7) 100%);
  background: linear-gradient(45deg, rgba(42, 27, 161, 0.7), rgba(29, 210, 177, 0.7) 100%);
}
h6 {
  line-height: 1.7;
}
</style>
