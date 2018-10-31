<template>
  <div id="app" class="bgTone">
    <Navigationbar />
    <div class="container">
      <router-view/>
    </div>
    <Footerbar />
  </div>
</template>

<script>
import Navbar2 from "./components/Navbar2";
import NewPet from "./components/NewPet";
import Footer from "./components/Footer";

export default {
  name: "app",
  components: {
    Navigationbar: Navbar2,
    NewPet,
    Footerbar: Footer
  }
};
</script>

<style>
nav {
  margin-bottom: 0px;
}
</style>
