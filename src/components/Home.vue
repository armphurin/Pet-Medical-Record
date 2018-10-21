<template>
  <!-- <div id="home">
    <ul class="collection with-header">
      <li class="collection-header"><h4>Pet Medic</h4></li>
      <li v-for="pet in pets" v-bind:key="pet.id" class="collection-item">
        <div class="chip">{{pet.pet_id}}</div>
        {{pet.pet_name}}: {{pet.dept}} 
         <router-link class="secondary-content" v-bind:to="{ name: 'view-pet', params: { pet_id: pet.pet_id }}">Show {{pet.pet_id}}<i class="fa fa-eye"></i></router-link>
      </li>
    </ul>
    <div class="fixed-action-btn">
      <router-link to="/new" class="btn-floating btn-large red">
        <i class="fa fa-plus"></i>
      </router-link>
    </div>
  </div> -->

      <!--ViewWrapper-->
    <view-wrapper class="home-owner">
      <md-mask class="d-flex justify-content-center align-items-center">
        <container>
          <row class="intro-section">
            <div class="white-text text-center text-md-center col-md-12 mt-xl-12 mb-12">
              <h1 class="h1-responsive font-weight-bold mt-sm-5">Welcome ...</h1>
              <hr class="hr-light"/>
            </div>
            <div class="white-text text-center text-md-center col-md-12 mt-xl-12 mb-12">
              <btn type="button" class="btn btn-profile text-left" @click.native="modal=true;">
                <h5 style="display:inline; margin-top:1em;"><img src="../assets/pic_owner.png" style="width:15%;display:inline;margin-right:1em;"/>Name : ...</h5>
              </btn><br>
            </div>
              <div class="white-text text-center text-md-center col-md-12 mt-xl-12 mb-12">
                <div>
                  <h3 class="content-label">My Pet List</h3>
                  <button type="button" class="btn btn-label text-center">Add Pet</button><br>
                </div>
              </div>
              <div class="white-text text-center text-md-center col-md-12 mt-xl-12 mb-12">
              <btn type="button" class="btn btn-pet text-left">
                <h5 style="display:inline; margin-top:1em;"><img src="../assets/pic_owner.png" style="width:15%;display:inline;margin-right:1em;"/>Pet : 03</h5>
              </btn><br>
              <btn type="button" class="btn btn-pet text-left">
                <h5 style="display:inline; margin-top:1em;"><img src="../assets/pic_owner.png" style="width:15%;display:inline;margin-right:1em;"/>Pet : 03</h5>
              </btn><br>
              <btn type="button" class="btn btn-pet text-left">
                <h5 style="display:inline; margin-top:1em;"><img src="../assets/pic_owner.png" style="width:15%;display:inline;margin-right:1em;"/>Pet : 03</h5>
              </btn><br>
              <a>see more</a>
            </div>
          </row>
        </container>
      </md-mask>

      <!-- Popup -->
      <modal v-if="modal" @close="modal = false" size="lg">
        <div class="popup-profile">
  <modal-header>
    <modal-title>My Profile Card</modal-title>
  </modal-header>
  <modal-body>
                    <row style="padding:1em;">
                  <column class="col-md-4">
                  <!-- picture -->
                  <div class="image-upload">
                  <label for="wizard-picturePro">
                        <img :src="image" class="picture-src picturePro" id="wizardPicturePreviewPro" @change="onFileChange" style="object-fit: cover; border-radius: 50%;"/>
                  </label>
<input type="file" multiple accept="image/jpeg" @change="onFileChange" id="wizard-picturePro" />
</div>
<div class="label-group">
                  <label for="fullname">Fullname</label>
                  <input class="form-control form-control-lg" type="text" placeholder="Full name" id="fullname" v-model="fullname" style="width:100%;margin: 0 auto;border-radius: 13px;"> 
</div>
                  <row>
                    <column>
                    <div class="label-group">
                    <label for="gender">Gender</label>
                    <select class="form-control form-control-lg show-placeholder" id="gender" v-model="gender" style="width:100%;margin: 0 auto;border-radius: 13px;">
                      <option>Male</option>
                      <option>Female</option>
                    </select>
                    </div>
                    </column>
                  </row>
                  <row>
                    <column>
                    <div class="label-group">
                    <label for="datetime">Date of Birth</label>
                    <datetime v-model="datetime"></datetime>
                    </div>             
                    </column>
                  </row>
                  </column>
                  <column class="col-md-8">
                  <row>
                    <column>
                    <div class="label-group">
                    <label for="email">Email</label>
                  <input class="form-control form-control-lg" type="text" placeholder="Email" id="email" v-model="email" style="width:100%;margin: 0 auto;border-radius: 13px;">
                    </div>
                    </column>
                  </row>
                  <row>
                    <column>
                    <div class="label-group">
                    <label for="password">Password</label>
                     <input class="form-control form-control-lg" type="password" placeholder="Password" id="password" v-model="password" style="width:100%;margin: 0 auto;border-radius: 13px;">
                    </div>
                    </column>
                    <column>
                    <div class="label-group">
                    <label for="confpassword">Confirm Password</label>
                     <input class="form-control form-control-lg" type="password" placeholder="Confirm Password" id="confpassword" v-model="confpassword" style="width:100%;margin: 0 auto;border-radius: 13px;">
                    </div>
                    </column>
                  </row>
                  <row>
                    <column>
                    <div class="label-group">
                    <label for="lineid">Line ID</label>
                     <input class="form-control form-control-lg" type="text" placeholder="Line ID" id="lineid" v-model="lineid" style="width:100%;margin: 0 auto;border-radius: 13px;">
                    </div>
                    </column>
                    <column>
                    <div class="label-group">
                    <label for="telephone">Telephone</label>
                     <input class="form-control form-control-lg" type="number" placeholder="Telephone" id="telephone" v-model="telephone" style="width:100%;margin: 0 auto;border-radius: 13px;">
                    </div>
                    </column>
                  </row>
                  <row>
                    <column>
                    <div class="label-group">
                    <label for="address">Address</label>
                    <textarea class="form-control" id="address" v-model="address" rows="5" placeholder="Address" style="width:100%;margin: 0 auto;border-radius: 13px;"></textarea>
                    </div>
                    </column>
                  </row>
                  </column>
                </row>
  </modal-body>
  <modal-footer>
    <btn color="secondary" @click.native="modal = false">Close</btn>
    <btn color="primary">Save changes</btn>
  </modal-footer>
        </div>
</modal>
<!-- Popup -->
    </view-wrapper>
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
  ModalFooter
} from "mdbvue";

import { Datetime } from 'vue-datetime';

export default {
  name: "home",
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
    'datetime':Datetime
  },
  data() {
    return {
      pets: [],
      loading: true,
      modal: false,
      progressUpload: 0,
      file: File,
      uploadTask: "",
      image: "",
      datetime:""
    };
  },
  methods: {
    alertTest: function(e) {
      alert("Testttttttttttttttt");
    },
    detectFiles(fileList) {
      Array.from(Array(fileList.length).keys()).map(x => {
        this.upload(fileList[x]);
      });
    },
    upload(file) {
      this.uploadTask = storage.ref("medic/imagenes").put(file);
    },
    onFileChange(e) {
      var files = e.target.files || e.dataTransfer.files;
      if (!files.length) return;
      this.createImage(files[0]);
      this.detectFiles(files);
    },
    createImage(file) {
      var image = new Image();
      var reader = new FileReader();
      var vm = this;

      reader.onload = e => {
        vm.image = e.target.result;
      };
      reader.readAsDataURL(file);
    },
                readURLPro: function(input) {
                if (input.files && input.files[0]) {
                    var reader = new FileReader();

                    reader.onload = function (e) {
                        $('#wizardPicturePreviewPro').attr('src', e.target.result).fadeIn('slow');
                    },
                    reader.readAsDataURL(input.files[0]);
                    this.detectFiles(input.files)
                }
            }
  },
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
      document.getElementsByClassName("vdatetime-input").setAttribute("placeholder", "Enter your number");
  }
};
</script>

<style>
html {
  background-size: cover;
  height: 100%;
  -webkit-background-size: cover;
  -moz-background-size: cover;
  -o-background-size: cover;
  background-size: cover;
  background-repeat: no-repeat;
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
body {
  background-color: transparent;
}

.view.home-owner {
  background-image: url("");
  background-repeat: no-repeat;
  background-size: cover;
  background-position: center center;
  height: calc(100vh - 60px);
  margin-top: -2em;
}
h6 {
  line-height: 1.7;
}

.btn-label {
  background-color: #e8c547;
  font-weight: 400;
  transition: transform 0.3s;
  padding-top: 0.5%;
  padding-bottom: 0.5%;
  padding-left: 1%;
  padding-right: 1%;
  border-radius: 20%;
  position: relative;
  left: 17%;
  color: black;
}

.content-label {
  font-weight: 400;
  position: absolute;
  left: 30%;
  top: 27%;
  font-size: 100%;
}

.btn-profile {
  background-color: #30323d !important;
  width: 42%;
  padding-top: 1%;
  padding-bottom: 1%;
  padding-left: 1%;
  padding-right: 5%;
  font-weight: 900;
  transition: transform 0.3s;
  border-radius: 20px;
}

.btn-pet {
  background-color: #e8c547 !important;
  width: 42%;
  padding-top: 1%;
  padding-bottom: 1%;
  padding-left: 1%;
  padding-right: 5%;
  font-weight: 900;
  transition: transform 0.3s;
  border-radius: 15px;
}

.btn-pet:hover {
  transform: scale(1.2);
}
.btn-profile:hover {
  transform: scale(1.2);
}

/* upload pic style */
#picPro {
  width: 30%;
}

/*Profile Pic Start*/
            .picture-container1{
                position: relative;
                height: 250px;
                width: 250px;
                cursor: pointer;
                text-align: center;
            }
            .picture-container2{
                position: relative;
                height: 380px;
                width: 940px;
                cursor: pointer;
                text-align: center;
            }
            .picturePro{
                width: 250px;
                height: 250px;
                background-color: #999999;
                border: 4px solid #CCCCCC;
                color: #FFFFFF;
                border-radius: 50%;
                /*margin: 0px auto;*/
                overflow: hidden;
                transition: all 0.2s;
                -webkit-transition: all 0.2s;
            }

            .picturePro:hover{
                border-color: #2ca8ff;
            }
            .content.ct-wizard-green .picture:hover{
                border-color: #05ae0e;
            }
            .content.ct-wizard-blue .picture:hover{
                border-color: #3472f7;
            }
            .content.ct-wizard-orange .picture:hover{
                border-color: #ff9500;
            }
            .content.ct-wizard-red .picture:hover{
                border-color: #ff3b30;
            }
            .picturePro input[type="file"] {
                cursor: pointer;
                display: block;
                height: 250px;
                left: 0;
                opacity: 0 !important;
                position: absolute;
                top: 0;
                width: 250px;
            }
            .picture-src{
                width: 10em;
                height: 10em;
            }
            /*Profile Pic End*/
.image-upload{
  text-align: center
}

.image-upload > input
{
    display: none;
}

.image-upload img
{
    cursor: pointer;
}

/* upload pic style */
@media only screen and (max-width: 360px) {
  .view.home-owner {
    margin-top: 1.5em;
  }
  .intro-section .btn {
    padding-left: 2rem;
    padding-right: 2rem;
  }
}

@media only screen and (min-width: 370px) and (max-width: 600px) {
  .view.home-owner {
    margin-top: 2em;
  }
}

/* Popup Style */
.popup-profile{
  border-radius: 100px;
}


/* Popup Style */

.vdatetime-input{
  width:100%;
  margin: 0 auto;
  border-radius: 13px;
  border: 1px solid #ced4da;
  color: #495057;
  background-color: #fff;
  background-clip: padding-box;
  text-rendering: auto;
  color: initial;
  letter-spacing: normal;
  word-spacing: normal;
  text-transform: none;
  text-indent: 0px;
  text-shadow: none;
  display: inline-block;
  text-align: start;
  margin: 0em;
  font: 400 13.3333px Arial;
  -webkit-writing-mode: horizontal-tb !important;
  padding: .5rem 1rem;
  font-size: 1.25rem;
  line-height: 1.5;
}
.label-group{
  margin-bottom: .5em;
}
label{
  font-weight: 500;
}
input::placeholder{
  color: grey !important;
  font-size: 80%;
}
</style>
