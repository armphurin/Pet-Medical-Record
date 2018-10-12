<template>
  <!-- <div>
    <div class="container">
    <div class="row">
      <div class="col s12 m8 offset-m2">
        <div class="login card-panel grey lighten-4 black-text center">
          <h3>Register</h3>
          <form action="index.html">
            <div class="input-field">
              <i class="material-icons prefix">email</i>
              <input type="email" id="email" v-model="email">
              <label for="email">Email Address</label>
            </div>
            <div class="input-field">
              <i class="material-icons prefix">lock</i>
              <input type="password" id="password" v-model="password">
              <label for="password">Password</label>
            </div>
            <button v-on:click="register" class="btn btn-large btn-extended grey lighten-4 black-text">Register</button>
          </form>
        </div>
      </div>
    </div>
  </div>
  </div> -->

  <div>
<form action="index.html" class="regis_content">
              <card>
              <card-body class="text-center">
  <img src="../assets/logo.png" alt="Pet Medic" class="logo" style="margin:0 auto;">
                <card-title>Register</card-title>
                <row>
                  <column>
                  ssdsdssdads
                  </column>
                  <column>
                  asdadsda
                  </column>
                </row>
              </card-body>
            </card>
</form>
  </div>


</template>

<script>
import firebase from 'firebase';
import { Card, CardImg, CardBody, CardTitle, CardText, Btn, Row, Column } from 'mdbvue';

export default {
  name: 'register',
  data: function() {
    return {
      email: '',
      password: ''
    };
  },
  components: {
    Card,
    CardImg,
    CardBody,
    CardTitle,
    CardText,
    Btn,
    Row,
    Column
  },
  methods: {
    register: function(e) {
      firebase
        .auth()
        .createUserWithEmailAndPassword(this.email, this.password)
        .then(
          user => {
            // console.log(user);
            alert(`Account Created for ${user.email}`);
            this.$router.go({ path: this.$router.path });
          },
          db.collection('profiles').doc(this.email).set({
            profile_id: "new",
            profile_name: "new",
            dept: "new",
            position: "new"
          }),
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
form.regis_content{
  margin-top: 50px;
}

html {
  min-height: 100%;
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

.logo{
  margin: 0 auto;
  width: 20%;
  height: 20%;
  z-index: 6;
}
.card-body{
  background: red;
}
</style>
