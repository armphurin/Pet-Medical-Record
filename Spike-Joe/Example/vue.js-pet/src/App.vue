<template>
  <div id="app">
    <img alt="Vue logo" src="./assets/logo.png">
    <Page1 msg="Welcome app.vue page app.vue"/>
  </div>
</template>

<script>
import HelloWorld from './components/HelloWorld.vue'
import Page1 from './components/page1.vue'

export default {
  name: 'app',
  components: {
    Page1
  }
}
</script>

<style>
#app {
  font-family: 'Avenir', Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  text-align: center;
  color: #2c3e50;
  margin-top: 60px;
}
</style>
