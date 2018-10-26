<template>
  <!-- <div>
    <div class="container">
    <div class="row">
      <div class="col s12 m8 offset-m2">
        <div class="login card-panel grey lighten-4 black-text center">
          <h3>Register</h3>
          <form action="index.html">
            <div class="input-field">
              <i class="material-icons prefix">email</i>
              <input type="email" id="email" v-model="email">
              <label for="email">Email Address</label>
            </div>
            <div class="input-field">
              <i class="material-icons prefix">lock</i>
              <input type="password" id="password" v-model="password">
              <label for="password">Password</label>
            </div>
            <button v-on:click="register" class="btn btn-large btn-extended grey lighten-4 black-text">Register</button>
          </form>
        </div>
      </div>
    </div>
  </div>
  </div> -->

  <div class="wrapper">
<form action="index.html" class="regis_content_vet">
              <card class="w-75 d-flex justify-content-center register" style="margin:0 auto;top:5em;z-index:2;">
              <card-body class="text-center">
                <div class="bg-card">
  <img src="../assets/logo.png" alt="Pet Medic" class="logo_regis" style="margin:0 auto;margin-bottom:2%;">
                <row style="padding:1em;">
                  <column class="col-md-4">
                  <!-- picture -->
                  <div class="image-upload">
                  <label for="wizard-picturePro">
                        <img :src="image" class="picture-src picturePro" id="wizardPicturePreviewPro" @change="onFileChange" style="object-fit: cover; border-radius: 50%;"/>
                  </label>
<input type="file" multiple accept="image/jpeg" @change="onFileChange" id="wizard-picturePro" />
</div>
    <!-- <div class="progress-bar" :style="{ width: progressUpload + '%'}">{{ progressUpload }}%</div> -->
    <!-- <button @click="removeImage">Remove image</button> -->
                  <br>
                  <input class="form-control form-control-lg" type="text" placeholder="Full name" id="fullname" v-model="fullname" style="width:100%;margin: 0 auto;border-radius: 13px;"> 
                  <br>
                  <row>
                    <column>
                    <input class="form-control form-control-lg" type="number" placeholder="Age" id="age" v-model="age" style="width:100%;margin: 0 auto;border-radius: 13px;"> 
              
                    </column>
                    <column>
                    <select class="form-control form-control-lg show-placeholder" id="gender" v-model="gender" style="width:100%;margin: 0 auto;border-radius: 13px;">
                      <option selected disabled>Gender</option>
                      <option>Male</option>
                      <option>Female</option>
                    </select>
                    </column>
                    </row>
                  </column>
                  <column class="col-md-8">
                  <row>
                    <column>
                  <input class="form-control form-control-lg" type="text" placeholder="Email" id="email" v-model="email" style="width:100%;margin: 0 auto;border-radius: 13px;">
                  <br>
                    </column>
                  </row>
                  <row>
                    <column>
                     <input class="form-control form-control-lg" type="password" placeholder="Password" id="password" v-model="fullname" style="width:100%;margin: 0 auto;border-radius: 13px;">
                     <br>
                    </column>
                  </row>
                  <row>
                    <column>
                     <input class="form-control form-control-lg" type="text" placeholder="Line ID" id="lineid" v-model="lineid" style="width:100%;margin: 0 auto;border-radius: 13px;">
                    </column>
                    <column>
                     <input class="form-control form-control-lg" type="number" placeholder="Telephone" id="telephone" v-model="telephone" style="width:100%;margin: 0 auto;border-radius: 13px;">
                     <br>
                    </column>
                  </row>
                  <row>
                    <column>
                    <textarea class="form-control" id="address" v-model="address" rows="4" placeholder="Address" style="width:100%;margin: 0 auto;border-radius: 13px;"></textarea>
                    </column>
                  </row>
                  </column>
                </row>
                <row>
                  <column>
                  <router-link to="/register"><button v-on:click="register" class="btn btn-elegant button-regis">Back</button></router-link>
                  <button v-on:click="register" class="btn btn-elegant button-regis">Register</button>
                  </column>
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
const storage = firebase.storage();
const storageRef = storage.ref();

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
  name: "register-vet",
  data: function() {
    return {
      email: "",
      password: "",
      age: "",
      gender: "",
      fullname: "",
      lineid: "",
      telephone: "",
      address: "",
      progressUpload: 0,
      file: File,
      uploadTask: "",
      image: ""
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
    register: function(e) {
      firebase
        .auth()
        .createUserWithEmailAndPassword(this.email, this.password)
        .then(
          user => {
            // console.log(user);
            alert(`Account Created for ${user.email}`);
            this.$router.go({ path: this.$router.path });
          },
          db
            .collection("profiles")
            .doc(this.email)
            .set({
              profile_id: "new",
              profile_name: "new",
              dept: "new",
              position: "new"
            }),
          err => {
            alert(err.message);
          }
        );
      e.preventDefault();
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
    removeImage: function(e) {
      this.image = "";
    },
    readURLPro: function(input) {
      if (input.files && input.files[0]) {
        var reader = new FileReader();

        (reader.onload = function(e) {
          $("#wizardPicturePreviewPro")
            .attr("src", e.target.result)
            .fadeIn("slow");
        }),
          reader.readAsDataURL(input.files[0]);
        this.detectFiles(input.files);
      }
    }
  },
  mounted() {
    $(".show-placeholder").select({
      placeholder: "Select a Gender",
      allowClear: true
    });
  },
  watch: {
    uploadTask: function() {
      this.uploadTask.on(
        "state_changed",
        sp => {
          this.progressUpload = Math.floor(
            (sp.bytesTransferred / sp.totalBytes) * 100
          );
        },
        null,
        () => {
          this.uploadTask.snapshot.ref.getDownloadURL().then(downloadURL => {
            this.$emit("url", downloadURL);
          });
        }
      );
    }
  }
};
</script>

<style>
form.regis_content_vet {
  /* margin-top: 7em;
  margin-bottom: 5em;
  margin-left: 5em;
  margin-right: 5em; */
  height: 50%;
  z-index: 2;
}

html {
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

body {
  background-color: transparent;
}

.logo_regis {
  margin: 0 auto;
  width: 20%;
  height: 20%;
  z-index: 6;
}
.card.register {
  background: linear-gradient(
    rgba(255, 255, 255, 0.2),
    rgba(255, 255, 255, 0.2)
  );
  border-radius: 80px;
  height: 36em;
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

.wrapper {
  position: absolute;
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
  overflow: hidden;
}

.progress-bar {
  margin: 10px 0;
}

/* upload pic style */
#picPro {
  width: 30%;
}

/*Profile Pic Start*/
.picture-container1 {
  position: relative;
  height: 250px;
  width: 250px;
  cursor: pointer;
  text-align: center;
}
.picture-container2 {
  position: relative;
  height: 380px;
  width: 940px;
  cursor: pointer;
  text-align: center;
}
.picturePro {
  width: 250px;
  height: 250px;
  background-color: #999999;
  border: 4px solid #cccccc;
  color: #ffffff;
  border-radius: 50%;
  /*margin: 0px auto;*/
  overflow: hidden;
  transition: all 0.2s;
  -webkit-transition: all 0.2s;
}

.picturePro:hover {
  border-color: #2ca8ff;
}
.content.ct-wizard-green .picture:hover {
  border-color: #05ae0e;
}
.content.ct-wizard-blue .picture:hover {
  border-color: #3472f7;
}
.content.ct-wizard-orange .picture:hover {
  border-color: #ff9500;
}
.content.ct-wizard-red .picture:hover {
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
.picture-src {
  width: 10em;
  height: 10em;
}
/*Profile Pic End*/
.image-upload > input {
  display: none;
}

.image-upload img {
  cursor: pointer;
}

/* upload pic style */
</style>
