<template>
  <div>
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
            <!-- <div class="input-field">
              <i class="material-icons prefix">person</i>
              <input type="text" id="fullname" v-model="fullname">
              <label for="text">Fullname</label>
            </div>
            <div class="input-field">
              <i class="material-icons prefix">face</i>
              <input type="text" id="age" v-model="age">
              <label for="text">Age</label>
            </div>
            <div class="input-field">
              <i class="material-icons prefix">wc</i>
              <input type="text" id="gender" v-model="gender">
              <label for="text">Gender</label>
            </div>
            <div class="input-field">
              <i class="material-icons prefix">phone</i>
              <input type="text" id="phone" v-model="phone">
              <label for="text">Telephone</label>
            </div>
            <div class="input-field">
              <i class="material-icons prefix">chat</i>
              <input type="text" id="line" v-model="line">
              <label for="text">Line ID</label>
            </div>
            <div class="input-field">
              <i class="material-icons prefix">address</i>
              <input type="text" id="address" v-model="address">
              <label for="text">Address</label>
            </div> -->
            <button v-on:click="register" class="btn btn-large btn-extended grey lighten-4 black-text">Register</button>
          </form>
        </div>
      </div>
    </div>
  </div>
  </div>
</template>

<script>
import firebase from 'firebase';
import db from './firebaseInit'

export default {
  name: 'register',
  data: function() {
    return {
      email: null,
      password: null
    };
  },
  methods: {
    // register: function(e) {
    //   firebase
    //     .auth()
    //     .createUserWithEmailAndPassword(this.email, this.password)
    //     .then(
    //       user => {
    //           db.collection('users').doc(this.email).set({
    //             email: this.email,
    //             password: this.password
    //           })
    //          console.log(user.email);
    //           alert(`Account Created for ${user.email}`);
    //          this.$router.go({ path: this.$router.path });
    //       },
    //       err => {
    //         alert(err.message);
    //       }
    //     );
        
    //   e.preventDefault();
    register: function(e) {
      firebase
        .auth()
        .createUserWithEmailAndPassword(this.email, this.password)
        .then(
          user => {
              db.collection('users').doc(this.email).set({
                email: this.email,
                password: this.password
              })
            //  console.log(user.email);
              alert(`Account Created for ${user.email}`);
             this.$router.push('/login');
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