<template>
  <div id="app" class="bgTone">
    <Navigationbar />
    <div class="container">
      <router-view/>
    </div>
  </div>
</template>

<script>
import Navbar2 from "./components/Navbar2";
import NewPet from "./components/NewPet";

export default {
  name: "app",
  components: {
    Navigationbar: Navbar2,
    NewPet
  }
};
</script>

<style>
nav {
  margin-bottom: 0px;
}
* {
  margin: 0;
  padding: 0;
  border: 0;
  outline: 0;
  font-size: 100%;
  vertical-align: baseline;
  background: transparent;
}
</style>
