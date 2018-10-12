<template>
  <div id="app">
    <Navigationbar />
    <div class="container">
      <router-view/>
    </div>
  </div>
</template>

<script>
import Navbar from './components/Navbar';
import NewPet from './components/NewPet';

export default {
  name: 'app',
  components: {
    'Navigationbar':Navbar,
    NewPet
  }
};
</script>

<style>
nav {
  margin-bottom: 10px;
}
</style>
