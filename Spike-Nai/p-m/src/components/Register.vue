<template>
  <div class="register">
    <h3>Register</h3>
    <form @submit.prevent="regis">
    <input type="text" v-model="username" placeholder="Username"><br>
    <input type="password" v-model="password" placeholder="Password"><br>
    <button v-on:click="regis" type="submit">Register</button>
    </form>
  </div>
</template>

<script>
    import firebase from 'firebase'

export default {
  name: 'register',
  data: function(){
      return {
          username: '',
          password: ''
      }
  },
  methods: {
      regis: function(){
          firebase.auth.createUserWithEmailAndPassword(this.username,this.password).then(
              function (user) {
                  alert('Your account has been created !')
              },
              function (err) {
                  alert('Oops. '+ err.message)
              }
          )
      }
  }
}
</script>

<style scoped>
 .login {
     margin-top: 40px;
 }
 input {
     margin: 5px 0;
     width: 25%;
     padding: 10px;
 }
 button{
     margin-top: 20px;
     width : 20%;
     padding: 5px;
     cursor: pointer;
 }

</style>

