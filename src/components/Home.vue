<template>
  <!-- <div id="home">
    <ul class="collection with-header">
      <li class="collection-header"><h4>Pet Medic</h4></li>
      <li v-for="pet in pets" v-bind:key="pet.id" class="collection-item">
        <div class="chip">{{pet.pet_id}}</div>
        {{pet.pet_name}}: {{pet.dept}} 
         <router-link class="secondary-content" v-bind:to="{ name: 'view-pet', params: { pet_id: pet.pet_id }}">Show {{pet.pet_id}}<i class="fa fa-eye"></i></router-link>
      </li>
    </ul>
    <div class="fixed-action-btn">
      <router-link to="/new" class="btn-floating btn-large red">
        <i class="fa fa-plus"></i>
      </router-link>
    </div>
  </div> -->

      <!--ViewWrapper-->
    <view-wrapper class="home-owner">
      <md-mask class="d-flex justify-content-center align-items-center">
        <container>
          <row class="intro-section">
            <div class="white-text text-center text-md-center col-md-12 mt-xl-12 mb-12">
              <h1 class="h1-responsive font-weight-bold mt-sm-5">Welcome ...</h1>
              <hr class="hr-light"/>
              <p>awdada</p>
              <btn>Name : ...</btn><br>
              <btn>Pet : 01</btn><br>
              <btn>Pet : 02</btn><br>
              <btn>Pet : 03</btn><br>
              <a>see more</a>
            </div>
          </row>
        </container>
      </md-mask>
    </view-wrapper>
    <!--/.ViewWrapper-->
</template>

<script>

import db from './firebaseInit'
import firebase from 'firebase'

import { Container, Row, Column, Navbar, NavbarCollapse, NavbarNav, NavbarItem, mdbInput, ViewWrapper, MdMask, Btn, mdbNavbarBrand, Card, CardImg, CardHeader, CardBody, CardTitle, CardText, CardFooter, CardUp, CardAvatar, CardGroup, Fa } from 'mdbvue';
export default {
  name: 'home',
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
  },
  data() {
    return {
      pets: [],
      loading: true
    };
  },
  created() {
    db
      .collection('users').doc(firebase.auth().currentUser.email).collection('pets')
      .orderBy('pet_id')
      .get()
      .then(querySnapshot => {
        this.loading = false;
        querySnapshot.forEach(doc => {
          const data = {
            id: doc.id,
            pet_id: doc.data().pet_id,
            pet_name: doc.data().pet_name,
            dept: doc.data().dept,
            position: doc.data().position
          };
          this.pets.push(data);
        });
      });
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

.view.home-owner {
  background-image: url('');
  background-repeat: no-repeat;
  background-size: cover;
  background-position: center center;
  height: calc(100vh - 60px);
}
h6 {
  line-height: 1.7;
}

@media only screen and (max-width: 360px) {
  .view.home-owner{
    margin-top: 1.5em;
  }
  .intro-section .btn{
    padding-left: 2rem;
    padding-right: 2rem;
  }
}

@media only screen and (min-width: 370px) and (max-width: 600px){
  .view.home-owner{
    margin-top: 2em;
  }
}
</style>
