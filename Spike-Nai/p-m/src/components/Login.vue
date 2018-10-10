<template>
  <div class="login">
    <input type="text" placeholder="Username"><br>
    <input type="password" placeholder="Password"><br>
    <button>Login</button>
  </div>
</template>

<script>

export default {
  name: 'login',
  data: function(){
      return {}
  },
  methodes: {}
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

