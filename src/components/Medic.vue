<template>
<div class="medic-owner">
    <md-mask class="d-flex justify-content-center align-items-center">
        <container>
          	<div class="header-button">
              <div class="scrolling-wrapper-flexbox text-center">
                <!-- pet 1 -->
  <label class="text-white" style="margin-top:1.3em;margin-left: 1.5em;"><div class="card-header img-scroll-dog"></div>Dog 1</label>
  <!-- pet 2 to n -->
  <label class="text-white" style="margin-top:1.3em;"><div class="card-header img-scroll-cat"></div>Cat 2</label>
<label class="text-white" style="margin-top:1.3em;"><div class="card-header img-scroll-dog"></div>Dog 3</label>
  <label class="text-white" style="margin-top:1.3em;"><div class="card-header img-scroll-cat"></div>Cat 4</label>
<label class="text-white" style="margin-top:1.3em;"><div class="card-header img-scroll-dog"></div>Dog 5</label>
  <label class="text-white" style="margin-top:1.3em;"><div class="card-header img-scroll-dog"></div>Dog 6</label>
  <label class="text-white" style="margin-top:1.3em;"><div class="card-header img-scroll-cat"></div>Cat 7</label>
<label class="text-white" style="margin-top:1.3em;"><div class="card-header img-scroll-dog"></div>Dog 8</label>
  <label class="text-white" style="margin-top:1.3em;"><div class="card-header img-scroll-cat"></div>Cat 9</label>
<label class="text-white" style="margin-top:1.3em;"><div class="card-header img-scroll-dog"></div>Dog 10</label>
  <label class="text-white" style="margin-top:1.3em;"><div class="card-header img-scroll-dog"></div>Dog 11</label>
  <label class="text-white" style="margin-top:1.3em;"><div class="card-header img-scroll-cat"></div>Cat 12</label>
<label class="text-white" style="margin-top:1.3em;"><div class="card-header img-scroll-dog"></div>Dog 13</label>
  <label class="text-white" style="margin-top:1.3em;"><div class="card-header img-scroll-cat"></div>Cat 14</label>
</div>
            </div>
        </container>
    </md-mask>
</div>
<!--/.ViewWrapper-->
</template>

<script>
import db from "./firebaseInit";
import firebase from "firebase";

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
  Fa,
  Modal,
  ModalHeader,
  ModalTitle,
  ModalBody,
  ModalFooter,
  Pagination,
  PageNav,
  PageItem
} from "mdbvue";

import { Datetime } from "vue-datetime";

export default {
  beforeCreate: function() {
    document.body.className = "body-medic";
  },
  name: "medic",
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
    Fa,
    Modal,
    ModalHeader,
    ModalTitle,
    ModalBody,
    ModalFooter,
    datetime: Datetime,
    Pagination,
    PageNav,
    PageItem,
    mdbInput
  },
  data() {
    return {
      pets: [],
      loading: true,
      popupProfile: false,
      popupPet: false,
      progressUpload: 0,
      file: File,
      uploadTask: "",
      image: "",
      datebirth: "",
      petbirth: ""
    };
  },
  methods: {},
  created() {
    db.collection("users")
      .doc(firebase.auth().currentUser.email)
      .collection("pets")
      .orderBy("pet_id")
      .get()
      .then(querySnapshot => {
        this.loading = false;
        querySnapshot.forEach(doc => {
          const data = {
            id: doc.id,
            pet_id: doc.data().pet_id,
            pet_name: doc.data().pet_name,
            dept: doc.data().dept,
            position: doc.data().position
          };
          this.pets.push(data);
        });
      });
    document
      .getElementsByClassName("vdatetime-input")
      .setAttribute("placeholder", "Enter your number");
  }
};
</script>

<style>
body.body-medic {
  background: url("../assets/bg_doc2.jpg") no-repeat center center fixed;
  -webkit-background-size: cover;
  -moz-background-size: cover;
  -o-background-size: cover;
  background-size: cover;
}
.medic-owner {
  margin-top: 3.5em;
}

/* checkbox and radio style */
input[type="checkbox"],
input[type="radio"] {
  border: 0;
  clip: rect(0 0 0 0);
  height: 1px;
  margin: -1px;
  overflow: hidden;
  padding: 0;
  position: absolute;
  width: 1px;
}
input[type="checkbox"]:hover + label:before,
input[type="radio"]:hover + label:before {
  border-color: #999;
}
input[type="checkbox"]:active + label:before,
input[type="radio"]:active + label:before {
  transition-duration: 0;
  filter: brightness(0.2);
}
input[type="checkbox"] + label,
input[type="radio"] + label {
  position: relative;
  padding-left: 26px;
  font-weight: normal;
}
input[type="checkbox"] + label:before,
input[type="checkbox"] + label:after,
input[type="radio"] + label:before,
input[type="radio"] + label:after {
  box-sizing: content-box;
  position: absolute;
  content: "";
  display: block;
  left: 0;
}
input[type="checkbox"] + label:before,
input[type="radio"] + label:before {
  top: 50%;
  width: 16px;
  height: 16px;
  margin-top: -10px;
  border: 2px solid #d9d9d9;
  text-align: center;
}
input[type="checkbox"] + label:after,
input[type="radio"] + label:after {
  background-color: #00bad2;
  top: 50%;
  left: 6px;
  width: 8px;
  height: 8px;
  margin-top: -4px;
  transform: scale(0);
  transform-origin: 50%;
  transition: transform 200ms ease-out;
}

input[type="radio"]:checked + label:before {
  -moz-animation: borderscale 300ms ease-in;
  -webkit-animation: borderscale 300ms ease-in;
  animation: borderscale 300ms ease-in;
  background-color: #fff;
}
input[type="radio"]:checked + label:after {
  transform: scale(1);
}
input[type="radio"] + label:before,
input[type="radio"] + label:after {
  border-radius: 50%;
}

input[type="checkbox"] + label:after {
  background-color: transparent;
  top: 50%;
  left: 5px;
  width: 7px;
  height: 4px;
  margin-top: -5px;
  border-style: solid;
  border-color: #00bad2;
  border-width: 0 0 3px 3px;
  -moz-transform: rotate(-45deg) scale(0);
  -ms-transform: rotate(-45deg) scale(0);
  -webkit-transform: rotate(-45deg) scale(0);
  transform: rotate(-45deg) scale(0);
  -moz-transition: none;
  -o-transition: none;
  -webkit-transition: none;
  transition: none;
}
input[type="checkbox"]:checked + label:before {
  -moz-animation: borderscale 200ms ease-in;
  -webkit-animation: borderscale 200ms ease-in;
  animation: borderscale 200ms ease-in;
}
input[type="checkbox"]:checked + label:after {
  content: "";
  -moz-transform: rotate(-45deg) scale(1);
  -ms-transform: rotate(-45deg) scale(1);
  -webkit-transform: rotate(-45deg) scale(1);
  transform: rotate(-45deg) scale(1);
  -moz-transition: -moz-transform 200ms ease-out;
  -o-transition: -o-transform 200ms ease-out;
  -webkit-transition: -webkit-transform 200ms ease-out;
  transition: transform 200ms ease-out;
}

@-moz-keyframes borderscale {
  50% {
    box-shadow: 0 0 0 2px #999;
  }
}
@-webkit-keyframes borderscale {
  50% {
    box-shadow: 0 0 0 2px #999;
  }
}
@keyframes borderscale {
  50% {
    box-shadow: 0 0 0 2px #999;
  }
}
/* checkbox and radio style */

/* dot style */
.scrolling-wrapper {
  overflow-x: scroll;
  overflow-y: hidden;
  white-space: nowrap;
}
.scrolling-wrapper .card-header {
  display: inline-block;
  color: white;
  border-radius: 50%;
}

.scrolling-wrapper-flexbox {
  display: flex;
  flex-wrap: nowrap;
  overflow-x: auto;
  align-items: center;
  justify-content: center;
}

.scrolling-wrapper-flexbox:first-child {
  z-index: 1;
}
.scrolling-wrapper-flexbox .card-header {
  flex: 0 0 auto;
  margin-top: 0.3em;
  margin-bottom: 0.3em;
  margin-right: 0.3em;
  margin-left: 0.3em;
  color: white;
  border-radius: 50%;
}

.card-header {
  border: 2px solid #c2c2c2;
  width: 50px;
  height: 50px;
  font-size: 100%;
  padding: 33px;
  -webkit-transition: all 200ms ease-in;
  -webkit-transform: scale(1);
  -ms-transition: all 200ms ease-in;
  -ms-transform: scale(1);
  -moz-transition: all 200ms ease-in;
  -moz-transform: scale(1);
  transition: all 200ms ease-in;
  transform: scale(1);
}

.card-header:hover {
  border: 2px solid #e8c547;
  box-shadow: 0px 0px 5px #000000;
  -webkit-transition: all 200ms ease-in;
  -webkit-transform: scale(1.5);
  -ms-transition: all 200ms ease-in;
  -ms-transform: scale(1.5);
  -moz-transition: all 200ms ease-in;
  -moz-transform: scale(1.5);
  transition: all 200ms ease-in;
  transform: scale(1.5);
  z-index: 2;
  position: relative;
}

.scrolling-wrapper,
.scrolling-wrapper-flexbox {
  height: 100%;
  width: 100%;
  -webkit-overflow-scrolling: touch;
}
.scrolling-wrapper::-webkit-scrollbar,
.scrolling-wrapper-flexbox::-webkit-scrollbar {
  display: none;
}

.img-scroll-dog {
  background: url("../assets/pic_dog2.png");
  -webkit-background-size: cover;
  -moz-background-size: cover;
  -o-background-size: cover;
  background-size: cover;
}

.img-scroll-cat {
  background: url("../assets/pic_cat.png");
  -webkit-background-size: cover;
  -moz-background-size: cover;
  -o-background-size: cover;
  background-size: cover;
}
/* dot style */
</style>
