<template>
<div class="wrapper">
    <container>
        <img src="../assets/logo.png" alt="Pet Medic" class="logo_regis">
        <form action="index.html" class="regis_content_vet">
            <card class="w-50 d-flex justify-content-center register-card" style="margin:0 auto;z-index:2;">
                <card-body>
                    <div class="bg-card">
                        <row style="padding:1em;">
                            <column class="col-md-4">
                                <!-- picture -->
                                <div class="image-upload text-center">
                                    <label for="wizard-picturePro">
                              <img :src="image" class="picture-src picturePro" id="wizardPicturePreviewPro" @change="onFileChange" style="object-fit: cover; border-radius: 50%;"/>
                            </label>
                                    <input type="file" multiple accept="image/jpeg" @change="onFileChange" id="wizard-picturePro" />
                        </div>
                                    <div class="label-group">
                                        <label for="fullname">Fullname</label>
                                        <input class="form-control form-control-lg" type="text" placeholder="Full name" id="fullname" v-model="fullname" style="width:100%;margin: 0 auto;border-radius: 13px;" required>
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
                                                    <datetime v-model="datebirth"></datetime>
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
                                            <input class="form-control form-control-lg" type="text" placeholder="Line ID" id="lineid" v-model="line_id" style="width:100%;margin: 0 auto;border-radius: 13px;">
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
                    </div>
                </card-body>
            </card>
        </form>
        <div class="obj-center">
            <router-link to="/register"><button  class="btn btn-elegant button-regis">Back</button></router-link>
            <button v-on:click="register" class="btn btn-elegant button-regis">Register</button>
        </div>
    </container>
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
import db from './firebaseInit.js';
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
import {
    Datetime
} from "vue-datetime";
// ES6 Modules or TypeScript
import swal from "sweetalert2";
export default {
    beforeCreate: function () {
        document.body.className = "body-registervet";
    },
    name: "register-vet",
    data: function () {
        return {
            email: "",
            password: "",
            age: "",
            gender: "",
            fullname: "",
            line_id: "",
            telephone: "",
            address: "",
            progressUpload: 0,
            file: File,
            uploadTask: "",
            image: "",
            confpassword: "",
            datebirth: "",
            visible: false,
            file_pic: null
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
        ViewWrapper,
        datetime: Datetime,
    },
    methods: {
        register: function (e) {

            var count_input_empty = "";
            if (!this.fullname) {
                count_input_empty = count_input_empty.concat("fullname, ")
            }
            if (!this.gender) {
                count_input_empty = count_input_empty.concat("gender, ")
            }
            if (!this.email) {
                count_input_empty = count_input_empty.concat("email, ")
            }
            if (!this.password) {
                count_input_empty = count_input_empty.concat("password, ")
            }
            if (!this.confpassword) {
                count_input_empty = count_input_empty.concat("confirm password, ")
            }
            if (!this.line_id) {
                count_input_empty = count_input_empty.concat("line_id, ")
            }
            if (!this.telephone) {
                count_input_empty = count_input_empty.concat("telephone, ")
            }
            if (!this.address) {
                count_input_empty = count_input_empty.concat("address, ")
            }
            if (!this.datebirth) {
                count_input_empty = count_input_empty.concat("datebirth, ")
            }
            if (!count_input_empty) {
                if (this.password == this.confpassword) {
                    if (this.file_pic) {
                        swal({
                            title: "Loading ...",
                            onOpen: () => {
                                swal.showLoading()
                            }
                        })
                        firebase
                            .auth()
                            .createUserWithEmailAndPassword(this.email, this.password)
                            .then(
                                user => {
                                    storage.ref(this.email + "/profile").put(this.file_pic[0]).then(user => {
                                        storageRef.child(this.email+"/profile").getDownloadURL().then( url=> {
                                            // this.urlImageProfile = url;
                                            console.log(url);
                                            db.collection('users').doc(this.email).set({
                                                email: this.email,
                                                gender: this.gender,
                                                password: this.password,
                                                fullname: this.fullname,
                                                line_id: this.line_id,
                                                telephone_number: this.telephone,
                                                address: this.address,
                                                datebirth: this.datebirth,
                                                urlImageProfile: url,
                                                user_type: "owner"
                                            }).then(user => {
                                                swal({
                                                    title: "Register Status",
                                                    text: `You are Register as ${this.email}`,
                                                    type: "success",
                                                    showConfirmButton: false,
                                                    timer: 1500
                                                }).then(result => {
                                                    this.$router.go({
                                                        path: this.$router.path
                                                    });
                                                });

                                            })

                                        })
                                    })

                                },
                                err => {
                                    swal({
                                        title: "Register Status",
                                        text: err.message,
                                        type: "error",
                                        showConfirmButton: false,
                                        timer: 1500,
                                        onOpen: () => {
                                            swal.hideLoading()
                                        }
                                    })
                                }
                            );
                        e.preventDefault();

                    }
                     if (!this.file_pic) {
                        swal({
                            title: "Loading ...",
                            onOpen: () => {
                                swal.showLoading()
                            }
                        })
                        firebase
                            .auth()
                            .createUserWithEmailAndPassword(this.email, this.password)
                            .then(
                                user => {
                                    db.collection('users').doc(this.email).set({
                                        email: this.email,
                                        gender: this.gender,
                                        password: this.password,
                                        fullname: this.fullname,
                                        line_id: this.line_id,
                                        telephone_number: this.telephone,
                                        address: this.address,
                                        datebirth: this.datebirth,
                                        user_type: "owner",
                                        urlImageProfile: ""
                                    }).then(user => {
                                        swal({
                                            title: "Register Status",
                                            text: `You are Register in Veterinary as ${this.email}`,
                                            type: "success",
                                            showConfirmButton: false,
                                            timer: 1500
                                        }).then(result => {
                                            this.$router.go({
                                                path: this.$router.path
                                            });
                                        });

                                    })

                                },
                                err => {
                                    swal({
                                        title: "Register Status",
                                        text: err.message,
                                        type: "error",
                                        showConfirmButton: false,
                                        timer: 1500,
                                        onOpen: () => {
                                            swal.hideLoading()
                                        }
                                    })
                                })
                        e.preventDefault();
                    }
                }
                if (this.password != this.confpassword) {
                    swal({
                        title: "Register Status",
                        text: "Password mismatch",
                        type: "error",
                        showConfirmButton: false,
                        timer: 1500
                    })
                }
            }
            if (count_input_empty) {
                swal({
                    title: "Register Status",
                    text: "Please fill out empty field",
                    type: "error",
                    showConfirmButton: false,
                    timer: 1500
                })
            }
            //   console.log(count_input_empty)

        },
        detectFiles(fileList) {
            Array.from(Array(fileList.length).keys()).map(x => {
                this.upload(fileList[x]);
            });
        },
        upload(file) {
            this.uploadTask = storage.ref(this.email + "/profile").put(file);
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
        removeImage: function (e) {
            this.image = "";
        },
        readURLPro: function (input) {
            if (input.files && input.files[0]) {
                var reader = new FileReader();

                (reader.onload = function (e) {
                    $("#wizardPicturePreviewPro")
                        .attr("src", e.target.result)
                        .fadeIn("slow");
                }),
                reader.readAsDataURL(input.files[0]);
                this.detectFiles(input.files);
            }
        }
    },
    watch: {
        uploadTask: function () {
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
body.body-registervet {
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

.vdatetime-input {
  width: 100%;
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
  padding: 0.5rem 1rem;
  font-size: 1.25rem;
  line-height: 1.5;
}
</style>

<style scoped>
form.regis_content_vet {
    /* margin-top: 7em;
  margin-bottom: 5em;
  margin-left: 5em;
  margin-right: 5em; */
    height: 61%;
    z-index: 2;
    margin: 0em;
}

body.body-registervet {
    min-height: 100%;
    width: 100%;
    -webkit-background-size: cover;
    -moz-background-size: cover;
    -o-background-size: cover;
    background-size: cover;
    background-repeat: no-repeat;
    background-position: center;
    background-attachment: fixed;
    background: rgb(52, 160, 217);
    /* Old browsers */
    background: -moz-linear-gradient(top,
        rgb(52, 160, 217) 0%,
        rgb(23, 169, 149) 56%,
        rgb(23, 169, 149) 100%);
    /* FF3.6-15 */
    background: -webkit-linear-gradient(top,
        rgb(52, 160, 217) 0%,
        rgb(23, 169, 149) 56%,
        rgb(23, 169, 149) 100%);
    /* Chrome10-25,Safari5.1-6 */
    background: linear-gradient(to bottom,
        rgb(52, 160, 217) 0%,
        rgb(23, 169, 149) 56%,
        rgb(23, 169, 149) 100%);
    /* W3C, IE10+, FF16+, Chrome26+, Opera12+, Safari7+ */
    filter: progid:DXImageTransform.Microsoft.gradient(startColorstr='#34a0d9', endColorstr='#17a995', GradientType=0);
    /* IE6-9 */
}

.logo_regis {
    width: 12%;
    height: 12%;
    z-index: 6;
    display: block;
    margin-left: auto;
    margin-right: auto;
    margin-top: 4em;
}

.obj-center {
  display: block;
  margin-left: auto;
  margin-right: auto;
  text-align: center;
  margin-top: 4.5em;
}

.card.register-card {
  background: linear-gradient(
    rgba(255, 255, 255, 0.2),
    rgba(255, 255, 255, 0.2)
  );
  border-radius: 2em;
  /*height: 107%;*/
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

.circle-in:hover~.circle-button {
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

.button-regis:hover~.circle-button {
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
    min-height: 100%;
    width: 100%;
    -webkit-background-size: cover;
    -moz-background-size: cover;
    -o-background-size: cover;
    background-size: cover;
    background-repeat: no-repeat;
    background-position: center;
    background-attachment: fixed;
    background: rgb(52, 160, 217);
    /* Old browsers */
    background: -moz-linear-gradient(top,
        rgb(52, 160, 217) 0%,
        rgb(23, 169, 149) 56%,
        rgb(23, 169, 149) 100%);
    /* FF3.6-15 */
    background: -webkit-linear-gradient(top,
        rgb(52, 160, 217) 0%,
        rgb(23, 169, 149) 56%,
        rgb(23, 169, 149) 100%);
    /* Chrome10-25,Safari5.1-6 */
    background: linear-gradient(to bottom,
        rgb(52, 160, 217) 0%,
        rgb(23, 169, 149) 56%,
        rgb(23, 169, 149) 100%);
    /* W3C, IE10+, FF16+, Chrome26+, Opera12+, Safari7+ */
    filter: progid:DXImageTransform.Microsoft.gradient(startColorstr='#34a0d9', endColorstr='#17a995', GradientType=0);
    /* IE6-9 */
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
.image-upload>input {
    display: none;
}

.image-upload img {
    cursor: pointer;
}

/* upload pic style */

/* Popup Style */

.vdatetime-input {
    width: 100%;
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
    padding: 0.5rem 1rem;
    font-size: 1.25rem;
    line-height: 1.5;
}

.label-group {
    margin-bottom: 0.5em;
}

label {
    font-weight: 500;
}

input::placeholder {
    color: grey !important;
    font-size: 80%;
}

@media only screen and (min-width: 300px) and (max-width: 1400px) {
  .wrapper {
    overflow: scroll;
  }
}

/*Common Responsive Portrait, Phone*/
@media only screen and (max-width: 600px) and (orientation: Portrait) {
  form.regis_content_vet {
    width: 150%;
    margin-left: -25%;
  }
  .obj-center {
    margin-top: 600px;
    margin-bottom: 5%;
  }
  .logo_regis {
    width: 10em;
    height: 5em;
  }
  .btn {
    width: 10em;
    height: 5em;
  }
}

/*Common Responsive Portrait, Higher Phone*/
@media only screen and (max-width: 600px) and (min-height: 700px) and (orientation: Portrait) {
  .obj-center {
    margin-top: 550px;
  }
}

/*Common Responsive Portrait, Tablet*/
@media only screen and (min-width: 600px) and (orientation: Portrait) {
  form.regis_content_vet {
    width: 140%;
    margin-left: -20%;
  }
  .logo_regis {
    width: 10em;
    height: 5em;
  }
  .obj-center {
    margin-top: -10%;
  }
}

/*Common Responsive Portrait, Larger Tablet*/
@media only screen and (min-width: 1024px) and (orientation: Portrait) {
  .obj-center {
    margin-top: -30%;
  }
}

/*Common Responsive Landscape, Phone*/
@media only screen and (max-width: 673px) and (orientation: Landscape) {
  .obj-center {
    margin-top: 775px;
    margin-bottom: 5%;
  }
}

/*Common Responsive Landscape, Wider Phone*/
@media only screen and (min-width: 673px) and (orientation: Landscape) {
  form.regis_content_vet {
    width: 125%;
    margin-left: -10%;
  }
  .obj-center {
    margin-top: 400px;
    margin-bottom: 5%;
  }
}

/*Common Responsive Landscape, Widest Phone*/
@media only screen and (min-width: 713px) and (orientation: Landscape) {
  form.regis_content_vet {
    width: 190%;
    margin-left: -45%;
  }
  .obj-center {
    margin-top: 305px;
    margin-bottom: 5%;
  }
}

/*Common Responsive Landscape, Tablet*/
@media only screen and (min-height: 700px) and (orientation: Landscape) {
  .obj-center {
    margin-top: 5%;
    margin-bottom: 5%;
  }
}
</style>
