<template>
  <div class="wrapper">
<form action="index.html" class="regis_content">
              <card class="register">
              <card-body class="text-center">
                <div class="bg-card">
                <row>
                  <column class="col-md-2"></column>
                  <column class="col-md-4">
                  <a class="link-right">
                    <router-link to="/register_owner">
                  <img src="../assets/owner.svg" class="img-fluid circle-in" alt="owner" style="width:36%; height:36%;top:-5.5%;">
                  <img src="../assets/circle.svg" class="img-fluid circle-button" alt="register">
                  <br>
                  <button class="btn btn-elegant button-regis">Owner</button>
                    </router-link>
                  </a>
                  </column>
                  <column class="col-md-4">
                  <a class="link-left">
                    <router-link to="/register_vet">
                  <img src="../assets/vet.svg" class="img-fluid circle-in" alt="vet">
                  <img src="../assets/circle.svg" class="img-fluid circle-button" alt="register">
                  <br>
                  <button class="btn btn-elegant button-regis">Veterinary</button>
                    </router-link>
                  </a>
                  </column>
                  <column class="col-md-2"></column>
                </row>
                </div>
              </card-body>
            </card>
</form>
<ul class="bg-bubbles">
		<li><img src="../assets/cat.svg" alt="cat"></li>
		<li><img src="../assets/cat.svg" alt="cat"></li>
		<li><img src="../assets/cat.svg" alt="cat"></li>
		<li><img src="../assets/cat.svg" alt="cat"></li>
		<li><img src="../assets/cat.svg" alt="cat"></li>
		<li><img src="../assets/cat.svg" alt="cat"></li>
		<li><img src="../assets/cat.svg" alt="cat"></li>
		<li><img src="../assets/cat.svg" alt="cat"></li>
		<li><img src="../assets/cat.svg" alt="cat"></li>
		<li><img src="../assets/cat.svg" alt="cat"></li>
		<li><img src="../assets/dogfood2.svg" alt="cat"></li>
		<li><img src="../assets/dog.svg" alt="cat"></li>
		<li><img src="../assets/dog.svg" alt="cat"></li>
		<li><img src="../assets/dogfood2.svg" alt="cat"></li>
		<li><img src="../assets/dogfood.svg" alt="cat"></li>
		<li><img src="../assets/dog.svg" alt="cat"></li>
		<li><img src="../assets/dogfood2.svg" alt="cat"></li>
		<li><img src="../assets/dog.svg" alt="cat"></li>
		<li><img src="../assets/dogfood.svg" alt="cat"></li>
		<li><img src="../assets/dog.svg" alt="cat"></li>
	</ul>

  </div>


</template>

<script>
import firebase from "firebase";
import {
  Card,
  CardImg,
  CardBody,
  CardTitle,
  CardText,
  Btn,
  Row,
  Column,
  MdMask,
  ViewWrapper
} from "mdbvue";

export default {
  beforeCreate: function() {
    document.body.className = "body-register";
  },
  name: "register",
  data: function() {
    return {
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
    Column,
    MdMask,
    ViewWrapper
  },
  methods: {
  }
};
</script>
<style>
body.body-register {
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
</style>

<style scoped>
form.regis_content {
  margin-top: 17%;
  /* margin-bottom: 5em; */
  /* margin-left: 17em;
  margin-right: 17em; */
  height: 100%;
  z-index: 2;
}

body.body-register {
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
.link-left {
}
.wrapper {
  position: absolute;
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
  overflow: hidden;
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

/* .logo_regis {
  margin: 0 auto;
  width: 20%;
  height: 20%;
  z-index: 6;
} */
.card.register {
  background: transparent;
  box-shadow: none !important;
}
.circle-button {
  width: 65%;
  height: 65%;
  margin: 0 auto;
  z-index: 5;
  position: relative;
  top: -19%;
  left: 1%;
}

.circle-in:hover ~ .circle-button {
  opacity: 0.2;
}

.circle-in {
  position: absolute;
  width: 35%;
  height: 35%;
  z-index: 6;
  top: -4%;
  left: 32%;
}
.button-regis {
  position: relative;
  width: 178px;
  margin: 0 auto;
  border-radius: 62px;
  top: -16.5%;
  z-index: 2;
}

.button-regis:hover ~ .circle-button {
  opacity: 0.2;
}

.bg-bubbles {
  position: absolute;
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
  z-index: 1;
}
.bg-bubbles li {
  position: absolute;
  list-style: none;
  display: block;
  width: 40px;
  height: 40px;
  bottom: -160px;
  -webkit-animation: square 23s infinite;
  animation: square 23s infinite;
  transition-timing-function: linear;
}
.bg-bubbles li:nth-child(1) {
  left: 10%;
}
.bg-bubbles li:nth-child(2) {
  left: 20%;
  width: 40px;
  height: 40px;
  -webkit-animation-delay: 0s;
  animation-delay: 0s;
  -webkit-animation-duration: 17s;
  animation-duration: 17s;
}
.bg-bubbles li:nth-child(3) {
  left: 25%;
  -webkit-animation-delay: 2s;
  animation-delay: 2s;
}
.bg-bubbles li:nth-child(4) {
  left: 40%;
  width: 30px;
  height: 30px;
  -webkit-animation-duration: 22s;
  animation-duration: 22s;
}
.bg-bubbles li:nth-child(5) {
  left: 70%;
}
.bg-bubbles li:nth-child(6) {
  left: 80%;
  width: 60px;
  height: 60px;
  -webkit-animation-delay: 1s;
  animation-delay: 1s;
}
.bg-bubbles li:nth-child(7) {
  left: 32%;
  width: 80px;
  height: 80px;
  -webkit-animation-delay: 5s;
  animation-delay: 5s;
}
.bg-bubbles li:nth-child(8) {
  left: 55%;
  width: 20px;
  height: 20px;
  -webkit-animation-delay: 13s;
  animation-delay: 13s;
  -webkit-animation-duration: 40s;
  animation-duration: 40s;
}
.bg-bubbles li:nth-child(9) {
  left: 25%;
  width: 10px;
  height: 10px;
  -webkit-animation-delay: 0s;
  animation-delay: 0s;
  -webkit-animation-duration: 40s;
  animation-duration: 40s;
}
.bg-bubbles li:nth-child(10) {
  left: 90%;
  width: 80px;
  height: 80px;
  -webkit-animation-delay: 9s;
  animation-delay: 9s;
}

.bg-bubbles li:nth-child(11) {
  left: 65%;
}
.bg-bubbles li:nth-child(12) {
  left: 50%;
  width: 40px;
  height: 40px;
  -webkit-animation-delay: 0s;
  animation-delay: 0s;
  -webkit-animation-duration: 17s;
  animation-duration: 17s;
}
.bg-bubbles li:nth-child(13) {
  left: 45%;
  -webkit-animation-delay: 2s;
  animation-delay: 2s;
}
.bg-bubbles li:nth-child(14) {
  left: 60%;
  width: 30px;
  height: 30px;
  -webkit-animation-duration: 22s;
  animation-duration: 22s;
}
.bg-bubbles li:nth-child(15) {
  left: 25%;
}
.bg-bubbles li:nth-child(16) {
  left: 15%;
  width: 60px;
  height: 60px;
  -webkit-animation-delay: 1s;
  animation-delay: 1s;
}
.bg-bubbles li:nth-child(17) {
  left: 5%;
  width: 80px;
  height: 80px;
  -webkit-animation-delay: 5s;
  animation-delay: 5s;
}
.bg-bubbles li:nth-child(18) {
  left: 0%;
  width: 20px;
  height: 20px;
  -webkit-animation-delay: 13s;
  animation-delay: 13s;
  -webkit-animation-duration: 40s;
  animation-duration: 40s;
}
.bg-bubbles li:nth-child(19) {
  left: 75%;
  width: 10px;
  height: 10px;
  -webkit-animation-delay: 0s;
  animation-delay: 0s;
  -webkit-animation-duration: 40s;
  animation-duration: 40s;
}
.bg-bubbles li:nth-child(20) {
  left: 63%;
  width: 60px;
  height: 60px;
  -webkit-animation-delay: 9s;
  animation-delay: 9s;
}

@-webkit-keyframes square {
  0% {
    -webkit-transform: translateY(0);
    transform: translateY(0);
  }
  100% {
    -webkit-transform: translateY(-400px) rotate(600deg);
    transform: translateY(-400px) rotate(600deg);
  }
}
@keyframes square {
  0% {
    -webkit-transform: translateY(0);
    transform: translateY(0);
  }
  100% {
    -webkit-transform: translateY(-400px) rotate(600deg);
    transform: translateY(-400px) rotate(600deg);
  }
}

@media only screen and (max-width: 600px) {
  .card.register {
    align-items: center;
    align-content: center;
  }
  .col {
    margin-bottom: 2em;
  }
  form.regis_content {
    margin-top: 7em;
    margin-left: 6em;
    margin-right: 5em;
    height: 50%;
    z-index: 2;
  }
}

@media only screen and (max-height: 600px) {
  .card.register {
    border-radius: 2em;
    align-items: center;
    align-content: center;
    height: 400px;
    width: 200px;
  }
  form.regis_content {
    margin-top: 7em;
    margin-left: 4em;
    margin-right: 5em;
    height: 50%;
    z-index: 2;
  }
}

/*Common Mobile Landscape*/
@media only screen and (max-width: 770px) and (orientation: landscape) {
  .row {
    flex-wrap: unset;
    margin-left: 20em;
  }
}

/*Pixel 2XL and iPhone X Landscape*/
@media only screen and (min-width: 810px) and (max-height: 420px) and (orientation: landscape) {
  .row {
    flex-wrap: unset;
    width: 40em;
    margin-left: 30em;
  }
}

/*Pixel 2 Landscape*/
@media only screen and (max-width: 740px) and (max-height: 420px) and (orientation: landscape) {
  .row {
    margin-left: 25em;
  }
}

/*iPhone 5/SE Landscape*/
@media only screen and (max-width: 570px) and (max-height: 330px) and (orientation: landscape) {
  .row {
    margin-left: 15em;
  }
}

/*Samsung Galaxy S5 Landscape*/
@media only screen and (min-width: 640px) and (max-height: 360px) and (orientation: landscape) {
  .row {
    margin-left: 20em;
  }
}
</style>
