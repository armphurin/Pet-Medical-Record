<template>

  <div>
    <!-- svg curve -->
    <div class="svg-container-top">
      <svg xmlns="http://www.w3.org/2000/svg" width="100%" height="100%" viewBox="0 0 1366 246">
      <ellipse cx="686" cy="270" rx="782" ry="248" style="fill:#fff;"/>
      </svg>
    </div>
    <!--ViewWrapper-->
    <view-wrapper class="home-page">
      <md-mask class="d-flex justify-content-center align-items-center">
        <container>
          <row class="intro-section">
            <div class="white-text text-center text-md-left col-md-6 mt-xl-5 mb-5">
              <h1 class="h1-responsive font-weight-bold mt-sm-5">Pet Medical Record System</h1>
              <hr class="hr-light"/>
              <h6 class="mb-4">This website is Pet Medical Record make it simple in few step.</h6>
              <router-link to="/register"><btn color="white" style="color:#17A995 !important;" class="btn-curve">Register</btn></router-link>
              <btn color="default" class="btn-curve">Learn more</btn>
            </div>
          </row>
        </container>
      </md-mask>
    </view-wrapper>
    <!--/.ViewWrapper-->
    <container>
    <section class="my-5">
      <h2 class="h1-responsive font-weight-bold my-5 text-center">Why is it so great?</h2>
      <p class="lead w-responsive mx-auto mb-5 text-center">Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam.</p>
      <row style="margin:2em;">
        <column md="6" class="text-center">
          <img src="../assets/easy.png" class="feature-icon text-center" />
        </column>
        <column md="6" class="feature-text">
          <h2 class="font-weight-bold my-4 feature-text-bold">Easy</h2>
          <p class="mb-md-0 mb-5">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Reprehenderit maiores aperiam minima assumenda deleniti hic.</p>
        </column>
      </row>
      <row style="margin:2em;">
        <column md="6" class="text-center order-md-3">
          <img src="../assets/engage.png" class="feature-icon text-center" />
        </column>
        <column md="6" class="feature-text order-md-2">
          <h2 class="font-weight-bold my-4 feature-text-bold">Engagement</h2>
          <p class="mb-md-0 mb-5">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Reprehenderit maiores aperiam minima assumenda deleniti hic.</p>
        </column>
      </row>
      <row style="margin:2em;">
        <column md="6" class="text-center">
          <img src="../assets/control.png" class="feature-icon text-center" />
        </column>
        <column md="6" class="feature-text">
          <h2 class="font-weight-bold my-4 feature-text-bold">Controll</h2>
          <p class="mb-md-0 mb-5">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Reprehenderit maiores aperiam minima assumenda deleniti hic.</p>
        </column>
      </row>
    </section>
  </container>
  <br/><br/>
<div class="svg-container-bottom">
<svg xmlns="http://www.w3.org/2000/svg" width="100%" height="100%" viewBox="0 0 1366 290">
    <image width="1366" height="351" xlink:href="data:img/png;base64,iVBORw0KGgoAAAANSUhEUgAABVYAAAFfAQMAAACftwWKAAAABGdBTUEAALGPC/xhBQAAACBjSFJNAAB6JgAAgIQAAPoAAACA6AAAdTAAAOpgAAA6mAAAF3CculE8AAAABlBMVEUXqZUAAABMHWedAAAAAWJLR0QB/wIt3gAAAAlwSFlzAAALEgAACxIB0t1+/AAAAAd0SU1FB+IKGxEWFTZRQG0AAABQSURBVHja7cEBAQAAAIIg/69uSEABAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA8G7r1AABJwQebQAAAABJRU5ErkJggg=="/>
    <ellipse class="cls-1" cx="686" cy="-33" rx="782" ry="248" style="fill:#fff;"/>
</svg>
    </div>
  </div>

</template>

<script>
import {
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
  Card,
  CardImg,
  CardHeader,
  CardBody,
  CardTitle,
  CardText,
  CardFooter,
  CardUp,
  CardAvatar,
  CardGroup,
  Fa
} from "mdbvue";

import firebase from "firebase";
export default {
  beforeCreate: function() {
    document.body.className = "body-homepage";
  },
  name: "home-page",
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
    Card,
    CardImg,
    CardHeader,
    CardBody,
    CardTitle,
    CardText,
    CardFooter,
    CardUp,
    CardAvatar,
    CardGroup,
    Fa
  }
};
</script>

<style>
.btn-curve {
  border-radius: 15px;
}
.feature-icon {
  width: 55%;
  height: 100%;
}
.feature-text {
  margin-top: auto;
  margin-bottom: auto;
}
.feature-text-bold {
  color: #2bbbad !important;
}

.svg-container-top {
  position: absolute;
  right: 0;
  left: 0;
  bottom: -12%;
  z-index: -1;
}

.svg-container-bottom {
  position: absolute;
  right: 0;
  left: 0;
  bottom: -135%;
  z-index: -1;
}

.view.home-page {
  background-image: url("");
  background-repeat: no-repeat;
  background-size: cover;
  background-position: center center;
  height: calc(100vh - 60px);
}
body.body-homepage {
  background-image: url("../assets/baner_homepage.png");
  background-repeat: no-repeat;
  background-size: cover;
  background-position: center center;
  height: calc(100vh - 60px);
  margin: 0;
  padding: 0;
}
h6 {
  line-height: 1.7;
}

/*Common Mobile Portrait*/
@media only screen and (min-width: 370px) and (max-width: 600px) and (orientation: portrait){
  .view.home-page {
    margin-top: 2em;
  }
  .svg-container-top{
    height: 17em;
  }
  .svg-container-bottom{
    bottom: -100em;
    height: 6em;
  }
}

/*Samsung Galaxy S5 Portrait*/
@media only screen and (max-width: 360px) and (max-height: 640px) and (orientation: portrait) {
  .body-homepage{
    margin-top: 5em;
  }
  .view.home-page {
    margin-top: 1.5em;
  }
  .intro-section .btn {
    padding-left: 2rem;
    padding-right: 2rem;
  }
  .svg-container-top{
    height: 15em;
  }
  .svg-container-bottom{
    bottom: -248%;
  }
}

/*iPhone 5/SE Portrait*/
@media only screen and (max-width: 320px) and (max-height: 570px) and (orientation: portrait) {
  .view.home-page {
    height: calc(100vh - 0px);
  }
  .mt-xl-5.col-md-6.col-xl-5 {
    bottom: 80px;
    width: 200px;
  }
  .img-fluid {
    left: 45px;
    top: 60px;
  }
  .intro-section.row {
    margin-bottom: 50px;
  }
  .svg-container-bottom{
    bottom: -105em;
  }
} 

/*iPhone 6/7/8 Portrait*/
@media only screen and (min-width: 375px) and (max-height: 670px) and (orientation: portrait) {
  .svg-container-bottom{
    bottom: -101em;
  }
}

/*iPhone 6/7/8 Plus Portrait*/
@media only screen and (min-width: 414px) and (max-height: 740px) and (orientation: portrait) {
  .svg-container-bottom{
    bottom: -98em;
  }
}

/*iPhone X Portrait*/
@media only screen and (min-width: 375px) and (max-width: 400px) and (max-height: 815px) and (orientation: portrait) {
  .svg-container-bottom{
    bottom: -101em;
  }
}

/*iPad Portrait*/
@media only screen and (min-width: 768px) and (max-height: 1025px) and (orientation: portrait) {
  .svg-container-bottom{
    bottom: -60em;
  }
}

/*iPad Pro Portrait*/
@media only screen and (min-width: 1000px) and (max-height: 1400px) and (orientation: portrait) {
  .svg-container-bottom{
    bottom: -66em;
    height: 15em;
  }
}

/*Common Mobile Landscape*/
@media only screen and (max-width: 770px) and (orientation: landscape) {
  .body-homepage{
    margin-top: 3em;
  }
  .intro-section.row {
    width: 350px;
    height: 270px;
    margin-bottom: 20px;
  }
  .img-fluid {
    left: 245px;
    bottom: 300px;
  }
  .mt-xl-5.col-md-6.col-xl-5 {
    padding-left: 50px;
  }
}

/*Pixel 2XL and iPhone X Landscape*/
@media only screen and (min-width: 810px) and (max-height: 420px) and (orientation: landscape) {
  .body-homepage{
    margin-top: 3.25em;
  }
  .mt-xl-5.col-md-6.col-xl-5 {
    padding-top: 50px;
    margin-bottom: 20px;
  }
}

/*iPhone 5/SE Landscape*/
@media only screen and (max-width: 570px) and (max-height: 330px) and (orientation: landscape) {
  .view.home-page{
    height: 20em;
  }
  .btn{
    width: 23.5em;
  }
  
  .intro-section.row {
    width: 350px;
    height: 200px;
  }
  .mt-xl-5.col-md-6.col-xl-5 {
    width: 270px;
    top: 40px;
    left: 40px;
    padding-top: 25px;
  }
}
</style>
