<template>

  <div>
    <!--ViewWrapper-->
    <view-wrapper class="home-page">
      <md-mask class="d-flex justify-content-center align-items-center">
        <container>
          <row>
            <div class="white-text text-center text-md-left col-md-6 mt-xl-5 mb-5">
              <h1 class="h1-responsive font-weight-bold mt-sm-5">Pet Medical Record System</h1>
              <hr class="hr-light"/>
              <h6 class="mb-4">This website is Pet Medical Record make it simple in few step.</h6>
              <router-link to="/register"><btn color="white">Register</btn></router-link>
              <btn outline="white">Learn more</btn>
            </div>
            <column md="6" xl="5" class="mt-xl-5">
              <img src="../assets/iphone.png" class="img-fluid animated bounce infinite w-50" style="height:100%;width:100%;margin:0 auto;"/>
            </column>
          </row>
        </container>
      </md-mask>
    </view-wrapper>
    <!--/.ViewWrapper-->
    <container>
    <section class="text-center my-5">
      <h2 class="h1-responsive font-weight-bold my-5">Why is it so great?</h2>
      <p class="lead w-responsive mx-auto mb-5">Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam.</p>
      <row>
        <column md="4">
          <fa icon="area-chart" size="3x" class="red-text"/>
          <h5 class="font-weight-bold my-4">Analytics</h5>
          <p class="mb-md-0 mb-5">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Reprehenderit maiores aperiam minima assumenda deleniti hic.</p>
        </column>
        <column md="4">
          <fa icon="book" size="3x" class="cyan-text"/>
          <h5 class="font-weight-bold my-4">Tutorials</h5>
          <p class="mb-md-0 mb-5">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Reprehenderit maiores aperiam minima assumenda deleniti hic.</p>
        </column>
        <column md="4">
          <fa icon="comments-o" size="3x" class="orange-text"/>
          <h5 class="font-weight-bold my-4">Support</h5>
          <p class="mb-md-0 mb-5">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Reprehenderit maiores aperiam minima assumenda deleniti hic.</p>
        </column>
      </row>
    </section>
  </container>

  <container>
    <section class="my-5">
      <h2 class="h1-responsive font-weight-bold text-center my-5">Why is it so great?</h2>
      <p class="lead w-responsive text-center mx-auto mb-5">Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam.</p>
      <row>
        <column lg="5" class="text-center text-lg-left">
          <img  class="img-fluid" src="https://mdbootstrap.com/img/Photos/Others/screens-section.jpg" alt="Sample image" />
        </column>
        <column lg="7">
          <row class="mb-3">
            <column size="1">
              <fa icon="mail-forward" size="lg" class="indigo-text"/>
            </column>
            <column xl="10" md="11" size="10">
              <h5 class="font-weight-bold mb-3">Safety</h5>
              <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit enim ad minima veniam, quis nostrum exercitationem ullam. Reprehenderit maiores aperiam assumenda deleniti hic.</p>
            </column>
          </row>
          <row class="mb-3">
            <column size="1">
              <fa icon="mail-forward" size="lg" class="indigo-text"/>
            </column>
            <column xl="10" md="11" size="10">
              <h5 class="font-weight-bold mb-3">Technology</h5>
              <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit enim ad minima veniam, quis nostrum exercitationem ullam. Reprehenderit maiores aperiam assumenda deleniti hic.</p>
            </column>
          </row>
          <row class="mb-3">
            <column size="1">
              <fa icon="mail-forward" size="lg" class="indigo-text"/>
            </column>
            <column xl="10" md="11" size="10">
              <h5 class="font-weight-bold mb-3">Finance</h5>
              <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit enim ad minima veniam, quis nostrum exercitationem ullam. Reprehenderit maiores aperiam assumenda deleniti hic.</p>
            </column>
          </row>
        </column>
      </row>
    </section>
  </container>

  </div>

</template>

<script>
import { Container, Row, Column, Navbar, NavbarCollapse, NavbarNav, NavbarItem, mdbInput, ViewWrapper, MdMask, Btn, mdbNavbarBrand, Card, CardImg, CardHeader, CardBody, CardTitle, CardText, CardFooter, CardUp, CardAvatar, CardGroup, CardDeck, Fa } from 'mdbvue';

import firebase from 'firebase';
export default {
  name: 'home-page',
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
    mdbNavbarBrand,
    Card, CardImg, CardHeader, CardBody, CardTitle, CardText, CardFooter, CardUp, CardAvatar, CardGroup,
    Fa
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

.view.home-page {
  background-image: url('');
  background-repeat: no-repeat;
  background-size: cover;
  background-position: center center;
  height: calc(100vh - 60px);
}
h6 {
  line-height: 1.7;
}

@media only screen and (max-width: 600px) {
  .view.home-page{
    margin-top: 1em;
  }
}

</style>
