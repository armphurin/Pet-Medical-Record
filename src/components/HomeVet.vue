<template>
<div class="home-owner">
    <md-mask class="d-flex justify-content-center align-items-center">
        <container>
            <row class="intro-section">
                <div class="white-text text-center text-md-center col-md-12 mt-xl-12 mb-12">
                    <h1 class="h1-responsive font-weight-bold mt-sm-5">Welcome ...</h1>
                    <hr class="hr-light" />
                </div>
                <div class="white-text text-center text-md-center col-md-12 mt-xl-12 mb-12">
                    <btn type="button" class="btn btn-profile text-left" @click.native="popupProfile=true, showImage()">
                        <h5 style="display:inline; margin-top:1em;"><img src="../assets/pic_owner.png" style="width:15%;display:inline;margin-right:1em;"/>{{fullname}}</h5>
                    </btn><br>
                </div>
                    <div class="white-text text-center text-md-center col-md-12 mt-xl-12 mb-12">
                        <div>
                            <h3 class="content-label">My Pet List</h3>
                            <btn type="button" class="btn btn-label text-center" @click.native="popupAddPet=true;">Add Pet</btn><br>
                        </div>
                        </div>
                        <div class="white-text text-center text-md-center col-md-12 mt-xl-12 mb-12">
                            <div v-for="pet in pets" v-bind:key="pet.id" class="collection-item">
                                <btn type="button" class="btn btn-pet text-left" @click.native="popupPet=true,show_pet.push(pet)">
                                    <h5 style="display:inline; margin-top:1em;"><img src="../assets/pic_owner.png" style="width:15%;display:inline;margin-right:1em;"/>{{pet.name}}</h5>
                                </btn><br>
                             </div>

                                <!-- hide area -->
                                <!-- <input type="checkbox" class="read-more-state read-more" id="pet-hidden" /> -->
                                <!-- <div class="read-more-wrap">
                                    <div class="read-more-target">
                                        <div v-for="pet in pets" v-bind:key="pet.id" class="collection-item">
                                            <btn type="button" class="btn btn-pet text-left" @click.native="popupPet=true,show_pet.push(pet)">
                                                <h5 style="display:inline; margin-top:1em;"><img src="../assets/pic_owner.png" style="width:15%;display:inline;margin-right:1em;"/>{{pet.name}}</h5>
                                            </btn><br>
                               </div>
                                        </div>
                                    </div> -->
                                <!-- <label for="pet-hidden" class="read-more-trigger"></label> -->
                            </div>
            </row>
        </container>
    </md-mask>

    <!-- Popup Profile-->
    <modal v-if="popupProfile" @close="popupProfile = false, password_change= false" size="lg">
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
                              <img :src="image ='https://firebasestorage.googleapis.com/v0/b/pet-medical-record-22d9a.appspot.com/o/medic%2Fimagenes?alt=media&token=a2b421d2-0aa4-4cff-aa8d-7cd6dd2e4aca'" class="picture-src picturePro" id="wizardPicturePreviewPro" @change="onFileChange" style="object-fit: cover; border-radius: 50%;"/>
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
                                            <input class="form-control form-control-lg show-placeholder" id="gender" v-model="gender" style="width:100%;margin: 0 auto;border-radius: 13px;" disabled>
                            </div>
                                    </column>
                                </row>
                                <row>
                                    <column>
                                        <div class="label-group">
                                            <label for="datetime">Age</label>
                                            <input  class="form-control form-control-lg" type="text" v-model="age"  style="width:100%;margin: 0 auto;border-radius: 13px;" disabled>
                              </div>
                                    </column>
                                </row>
                    </column>
                    <column class="col-md-8">
                        <row>
                            <column>
                                <div class="label-group">
                                    <label for="email">Email</label>
                                    <input class="form-control form-control-lg" type="text" placeholder="Email" id="email" v-model="email" style="width:100%;margin: 0 auto;border-radius: 13px;" disabled>
                                </div>
                            </column>
                        </row>
                        <row>
                            <column>
                                <div class="label-group">
                                    <label for="password">Password</label>
                                    <input class="form-control form-control-lg" type="password" placeholder="Password" id="password" v-model="password" style="width:100%;margin: 0 auto;border-radius: 13px;" disabled>
                                </div>
                            </column>
                            <column>
                                <div class="label-group" v-if="password_change">
                                    <label for="confpassword">Old Password</label>
                                    <input class="form-control form-control-lg" type="password" placeholder="Old Password" id="Oldfpassword" v-model="oldpassword" style="width:100%;margin: 0 auto;border-radius: 13px;">
                                </div>
                            </column>
                        </row>
                        <row v-if="password_change">
                            <column>
                                <div class="label-group">
                                    <label for="password">New Password</label>
                                    <input class="form-control form-control-lg" type="password" placeholder="Password" id="newpassword" v-model="newpassword" style="width:100%;margin: 0 auto;border-radius: 13px;">
                                </div>
                            </column>
                            <column>
                                <div class="label-group">
                                    <label for="confpassword">Confirm New Password</label>
                                    <input class="form-control form-control-lg" type="password" placeholder="Confirm New Password" id="confnewpassword" v-model="confnewpassword" style="width:100%;margin: 0 auto;border-radius: 13px;">
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
                <btn color="warning" @click.native="changePassword" v-if="!password_change">Change Password</btn>
                <btn color="default" @click.native="popupProfile = false, password_change= false">Close</btn>
                <btn color="primary" @click.native="updateProfile">Save changes</btn>
            </modal-footer>
        </div>
    </modal>
    <!-- Popup -->

    <!-- Popup Pet -->
    <modal v-if="popupPet" @close="popupPet = false, show_pet.pop()" size="lg">
        <div class="popup-profile">
            <modal-header>
                <modal-title>My Pet Card</modal-title>
            </modal-header>
            <modal-body>
                <row style="padding:1em;">
                    <column class="col-md-5">
                        <!-- picture -->
                        <div class="image-upload">
                            <label for="wizard-picturePro">
                              <img :src="image" class="picture-src picturePro" id="wizardPicturePreviewPro" @change="onFileChange" style="object-fit: cover; border-radius: 50%;"/>
                            </label>
                            <input type="file" multiple accept="image/jpeg" @change="onFileChange" id="wizard-picturePro" />
                        </div>
                            <div class="label-group">
                                <label for="petname">Pet Name</label>
                                <input class="form-control form-control-lg" type="text" placeholder="Pet Name" id="petname" v-model="show_pet[0].name" style="width:100%;margin: 0 auto;border-radius: 13px;" disabled>
                            </div>
                                <row>
                                    <column>
                                        <div class="label-group">
                                            <label for="petbirth">Age</label>
                                            <input class="form-control form-control-lg" type="text" placeholder="Age" id="petage" v-model="show_pet[0].age" style="width:100%;margin: 0 auto;border-radius: 13px;" disabled>
                                        </div>
                                    </column>
                                    <column>
                                        <div class="label-group">
                                            <label for="petgender">Gender</label>
                                            <select class="form-control form-control-lg show-placeholder" id="petgender" v-model="show_pet[0].gender" style="width:100%;margin: 0 auto;border-radius: 13px;" disabled>
                                <option>Male</option>
                                <option>Female</option>
                              </select>
                                        </div>
                                    </column>
                                </row>
                    </column>
                    <column class="col-md-7">
                        <row class="text-center">
                            <column>
                                <mdb-input type="radio" name="pettype" id="dog" label="Dog" v-if="show_pet[0].type=='dog'" checked disabled />
                                <mdb-input type="radio" name="pettype" id="dog" label="Dog" v-if="show_pet[0].type=='cat'" disabled />
                            </column>
                            <column>
                                <mdb-input type="radio" name="pettype" id="cat" label="Cat" v-if="show_pet[0].type=='dog'" disabled />
                                <mdb-input type="radio" name="pettype" id="cat" label="Cat" v-if="show_pet[0].type=='cat'" checked disabled />
                            </column>
                        </row>
                        <row>
                            <column>
                                <div class="label-group">
                                    <label for="breed">Breed</label>
                                    <input class="form-control form-control-lg" type="text" placeholder="Breed" id="breed" v-model="show_pet[0].breed" style="width:100%;margin: 0 auto;border-radius: 13px;">
                                </div>
                            </column>
                        </row>
                        <row>
                            <column>
                                <div class="label-group">
                                    <label for="colour">Colour</label>
                                    <input class="form-control form-control-lg" type="text" placeholder="Colour" id="colour" v-model="show_pet[0].color" style="width:100%;margin: 0 auto;border-radius: 13px;">
                              </div>
                            </column>
                        </row>
                        <row>
                            <column>
                                <div class="label-group">
                                    <label for="marking">Markings</label>
                                    <textarea class="form-control" id="marking" v-model="show_pet[0].marking" rows="5" placeholder="Marking" style="width:100%;margin: 0 auto;border-radius: 13px;"></textarea>
                                </div>
                            </column>
                        </row>
                    </column>
                </row>
            </modal-body>
            <modal-footer>
                <btn color="default" @click.native="popupPet = false,show_pet.pop()">Close</btn>
                <btn color="danger" @click.native="deletePet">Delete</btn>
                <btn color="primary" @click.native="updatePet">Save changes</btn>
            </modal-footer>
        </div>
    </modal>
    <!-- Popup -->

    <!-- Popup Add pet -->
    <modal v-if="popupAddPet" @close="popupAddPet = false" size="lg">
        <div class="popup-profile">
            <modal-header>
                <modal-title>My Pet Card</modal-title>
            </modal-header>
            <modal-body>
                <row style="padding:1em;">
                    <column class="col-md-5">
                        <!-- picture -->
                        <div class="image-upload">
                            <label for="wizard-picturePro">
                              <img :src="image" class="picture-src picturePro" id="wizardPicturePreviewPro" @change="onFileChange" style="object-fit: cover; border-radius: 50%;"/>
                            </label>
                            <input type="file" multiple accept="image/jpeg" @change="onFileChange" id="wizard-picturePro" />
                        </div>
                            <div class="label-group">
                                <label for="petname">Pet Name</label>
                                <input class="form-control form-control-lg" type="text" placeholder="Pet Name" id="petname" v-model="pet_name" style="width:100%;margin: 0 auto;border-radius: 13px;">
                            </div>
                                <row>
                                    <column>
                                        <div class="label-group">
                                            <label for="petbirth">Date of Birth</label>
                                            <datetime v-model="pet_birth"></datetime>
                                        </div>
                                    </column>
                                    <column>
                                        <div class="label-group">
                                            <label for="petgender">Gender</label>
                                            <select class="form-control form-control-lg show-placeholder" id="petgender" v-model="pet_gender" style="width:100%;margin: 0 auto;border-radius: 13px;">
                                <option>Male</option>
                                <option>Female</option>
                              </select>
                                        </div>
                                    </column>
                                </row>
                    </column>
                    <column class="col-md-7">
                        <row class="text-center">
                            <column>
                                <mdb-input type="radio" name="pet_type" id="dog" label="Dog" value="dog" @click.native="pet_type='dog'" />
                            </column>
                            <column>
                                <mdb-input type="radio" name="pet_type" id="cat" label="Cat" value="cat" @click.native="pet_type='cat'" />
                            </column>
                        </row>
                        <row>
                            <column>
                                <div class="label-group">
                                    <label for="breed">Breed</label>
                                    <input class="form-control form-control-lg" type="text" placeholder="Breed" id="breed" v-model="pet_breed" style="width:100%;margin: 0 auto;border-radius: 13px;">
                                </div>
                            </column>
                        </row>
                        <row>
                            <column>
                                <div class="label-group">
                                    <label for="colour">Colour</label>
                                    <input class="form-control form-control-lg" type="text" placeholder="Colour" id="color" v-model="pet_color" style="width:100%;margin: 0 auto;border-radius: 13px;">
                              </div>
                            </column>
                        </row>
                        <row>
                            <column>
                                <div class="label-group">
                                    <label for="marking">Markings</label>
                                    <textarea class="form-control" id="marking" v-model="pet_marking" rows="5" placeholder="Marking" style="width:100%;margin: 0 auto;border-radius: 13px;"></textarea>
                                </div>
                            </column>
                        </row>
                    </column>
                </row>
            </modal-body>
            <modal-footer>
                <btn color="default" @click.native="popupAddPet = false">Close</btn>
                <btn color="primary" @click.native="add_pet">Submit</btn>
            </modal-footer>
        </div>
    </modal>
    <!-- Popup -->
</div>
<!--/.ViewWrapper-->
</template>

<script>
import db from "./firebaseInit";
import firebase from "firebase";
const storage = firebase.storage();
const storageRef = storage.ref();
import swal from "sweetalert2";
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

import {
    Datetime
} from "vue-datetime";

export default {
    beforeCreate: function () {
        document.body.className = "body-home";
    },
    name: "home-vet",
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
        mdbInput,
    },
    data() {
        return {
            pet_type: "",
            show_pet: [],
            pet_name: "",
            pet_gender: "",
            pet_breed: "",
            pet_color: "",
            pet_birth: "",
            pet_marking: "",
            email: "",
            fullname: "",
            password: "",
            address: "",
            age: "",
            gender: "",
            lineid: "",
            telephone: "",
            pets: [],
            loading: true,
            popupProfile: false,
            popupPet: false,
            progressUpload: 0,
            file: File,
            uploadTask: "",
            image: "",
            datebirth: "",
            petbirth: "",
            oldpassword: "",
            newpassword: "",
            confnewpassword: "",
            popupAddPet: false,
            password_change: false,
            urlImage: null
        };
    },
    methods: {
        showImage: function (e) {
            // console.log("ShowImage")
            storageRef.child('medic/imagenes').getDownloadURL().then(function (url) {
                // document.querySelector('img').src = url;
                // var urlImage
                // alert(url);
                // console.log(url);
                // console.log(urlImage);
                // this.urlImage = url;
                // console.log(urlImage);
            })
        },
        changePassword() {
            this.password_change = true

        },
        reAuthenticate(currentPassword) {
            var cred = firebase.auth.EmailAuthProvider.credential(this.email, currentPassword);
            return firebase.auth().currentUser.reauthenticateWithCredential(cred);
        },
        deletePet() {
            const toast = swal.mixin({
                toast: true,
                position: 'top-end',
                showConfirmButton: false,
                timer: 2000
            });
            swal({
                title: 'Are you sure?',
                type: 'warning',
                showCancelButton: true,
                confirmButtonColor: '#3085d6',
                cancelButtonColor: '#d33',
                confirmButtonText: 'Yes, delete it!'
            }).then((result) => {
                if (result.value) {
                    swal({
                        title: 'Loading ...',
                        showConfirmButton: false,
                        showCancelButton: false,
                        onOpen: () => {
                            swal.showLoading()
                        }
                    });
                    db
                        .collection('users').doc(this.email).collection('pets')
                        .where('pet_id', '==', this.show_pet[0].pet_id)
                        .get()
                        .then(querySnapshot => {
                            querySnapshot.forEach(doc => {
                                doc.ref.delete().then(doc => {
                                    toast({
                                        type: 'success',
                                        title: 'Your pet has been deleted'
                                    }).then(result => {
                                        this.$router.go(this.$route.path);
                                    })
                                })
                            });
                        });
                }
            })
        },
        validateInput(data_type) {
            var count_input_empty = "";
            if (data_type == "user") {
                if (this.password_change) {
                    if (!this.fullname) {
                        return false;
                    }
                    if (!this.lineid) {
                        return false;
                    }
                    if (!this.address) {
                        return false;
                    }
                    if (!this.telephone) {
                        return false;
                    }
                    if (!this.oldpassword) {
                        return false;
                    }
                    if (!this.newpassword) {
                        return false;
                    }
                    if (!this.confnewpassword) {
                        return false;
                    }
                    return true;
                }
                if (!this.password_change) {
                    if (!this.fullname) {
                        return false;
                    }
                    if (!this.lineid) {
                        return false;
                    }
                    if (!this.address) {
                        return false;
                    }
                    if (!this.telephone) {
                        return false;
                    }
                    return true;
                }
            }

            if (data_type == "add_pet") {
                if (!this.pet_name) {
                    return false;
                }
                if (!this.pet_type) {
                    return false;
                }
                if (!this.pet_breed) {
                    return false;
                }
                if (!this.pet_birth) {
                    return false;
                }
                if (!this.pet_gender) {
                    return false;
                }
                if (!this.pet_color) {
                    return false;
                }
                if (!this.pet_marking) {
                    return false;
                }
                return true;
            }

            if (data_type == "update_pet") {
                if (!this.show_pet[0].breed) {
                    return false;
                }
                if (!this.show_pet[0].color) {
                    return false;
                }
                if (!this.show_pet[0].marking) {
                    return false;
                }
                return true;
            }
        },
        calAgePet(e) {
            if (!e) {
                return 0;
            } else {
                var today = new Date();
                var dob = e.split("-");
                var year = Number(dob[0]);
                var month = Number(dob[1]) - 1;
                var split_day = dob[2].split("T");
                var day = Number(today.getDate()) - Number(split_day[0]);
                var yearsOld = Number(today.getFullYear()) - year;
                var monthsOld = today.getMonth() - month;
                console.log("Age : " + yearsOld + " years " + monthsOld + " months " + day + " days ")
                if (yearsOld == 0) {
                    return (monthsOld + " Months")
                } else if (yearsOld > 0 && monthsOld > 0) {
                    return (yearsOld + " Years " + monthsOld + " Months")
                } else if (yearsOld > 0 && monthsOld < 0) {
                    yearsOld = yearsOld - 1;
                    monthsOld = 12 + monthsOld;
                    return (yearsOld + " Years " + monthsOld + " Months")
                } else {
                    return (yearsOld + " Years ")
                }
            }
        },
        calculateAge() {
            var today = new Date();
            var dob = this.datebirth.split("-");
            var year = Number(dob[0]);
            var month = Number(dob[1]) - 1;
            var split_day = dob[2].split("T");
            var day = Number(split_day[0]);
            var age = today.getFullYear() - year;
            if (today.getMonth() < month || (today.getMonth() == month && today.getDate() < day)) {
                age--;
            }
            this.age = age;
            console.log(age);
        },
        updatePet() {
            swal({
                title: 'Loading ...',
                onOpen: () => {
                    swal.showLoading()
                }
            });
            const toast = swal.mixin({
                toast: true,
                position: 'top-end',
                showConfirmButton: false,
                timer: 2000
            });
            var checkInput = this.validateInput("update_pet")
            if (checkInput) {
                db.collection("users")
                    .doc(this.email)
                    .collection("pets")
                    .doc(this.email + "_" + this.show_pet[0].name)
                    .update({
                        breed: this.show_pet[0].breed,
                        marking: this.show_pet[0].marking,
                        color: this.show_pet[0].color
                    })
                    .then(user => {
                        toast({
                            type: 'success',
                            title: 'Update pet successfully'
                        }).then(result => {
                            this.popupAddPet = false;
                            this.$router.go(this.$route.path);
                        });
                    });
            } else {
                toast({
                    type: 'error',
                    title: 'Plaese Fill out empty field',
                    onOpen: () => {
                        swal.hideLoading()
                    }
                });
            }
        },
        add_pet() {
            const toast = swal.mixin({
                toast: true,
                position: 'top-end',
                showConfirmButton: false,
                timer: 2000
            });
            var checkInput = this.validateInput("add_pet");
            if (checkInput) {
                swal({
                    title: 'Loading ...',
                    onOpen: () => {
                        swal.showLoading()
                    }
                });
                db.collection("users")
                    .doc(this.email)
                    .collection("pets")
                    .doc(this.email + "_" + this.pet_name)
                    .set({
                        pet_id: this.email + "_" + this.pet_name,
                        pet_name: this.pet_name,
                        breed: this.pet_breed,
                        gender: this.pet_gender,
                        marking: this.pet_marking,
                        dob: this.pet_birth,
                        color: this.pet_color,
                        pet_type: this.pet_type
                    })
                    .then(doc => {
                        toast({
                            type: 'success',
                            title: 'Add pet successfully'
                        }).then(result => {
                            this.popupAddPet = false;
                            this.$router.go(this.$route.path);
                        })
                    });
            } else {
                toast({
                    type: 'error',
                    title: 'Plaese Fill out empty field'
                })
            }
        },
        updateProfile() {
            const toast = swal.mixin({
                toast: true,
                position: 'top-end',
                showConfirmButton: false,
                timer: 2000
            });
            var checkInput = this.validateInput("user");
            if (checkInput) {
                if (!this.password_change) {
                    swal({
                        title: 'Loading ...',
                        onOpen: () => {
                            swal.showLoading()
                        }
                    });
                    db.collection("users")
                        .doc(this.email)
                        .update({
                            fullname: this.fullname,
                            line_id: this.lineid,
                            telephone_number: this.telephone,
                            address: this.address
                        })
                        .then(user => {
                            toast({
                                type: 'success',
                                title: 'Update Profile Successfully'
                            }).then(result => {
                                this.popupProfile = false;
                                this.$router.go(this.$route.path);
                            })
                        });
                }
                if (this.password_change) {
                    if (this.password != this.oldpassword) {
                        toast({
                            type: 'error',
                            title: 'Old Password mismatch'
                        });
                    }
                    if (this.newpassword != this.confnewpassword) {
                        toast({
                            type: 'error',
                            title: 'New Password mismatch'
                        });
                    } else {
                        if (this.password != this.oldpassword) {
                            toast({
                                type: 'error',
                                title: 'Old Password mismatch'
                            });
                        }
                        if (this.password == this.oldpassword) {
                            swal({
                                title: 'Loading ...',
                                onOpen: () => {
                                    swal.showLoading()
                                }
                            });
                            this.reAuthenticate(this.password).then(() => {
                                var user = firebase.auth().currentUser;
                                user.updatePassword(this.newpassword).then(() => {
                                    db.collection("users").doc(this.email).update({
                                        password: this.newpassword
                                    }).then(() => {
                                        toast({
                                            type: 'success',
                                            title: 'Update Profile Successfully'
                                        }).then(result => {
                                            this.popupProfile = false;
                                            this.$router.go(this.$route.path);
                                        }).catch((error) => {
                                            toast({
                                                type: 'error',
                                                title: error.message
                                            })
                                        })

                                    }).catch((error) => {
                                        toast({
                                            type: 'error',
                                            title: error.message
                                        })
                                    })
                                }).catch((error) => {
                                    toast({
                                        type: 'error',
                                        title: error.message
                                    })
                                })
                            })
                        }
                    }
                }

            } else {
                toast({
                    type: 'error',
                    title: 'Plaese Fill out empty field'
                });
            }
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
                 this.image = e.target.result;
            };
             reader.readAsDataURL(file);
        },
        // readURLPro: function (input) {
        //     if (input.files && input.files[0]) {
        //         var reader = new FileReader();

        //         (reader.onload = function (e) {
        //             $("#wizardPicturePreviewPro")
        //                 .attr("src", e.target.result)
        //                 .fadeIn("slow");
        //         }),
        //         reader.readAsDataURL(input.files[0]);
        //         this.detectFiles(input.files);
        //     }
        // }
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
                        name: doc.data().pet_name,
                        breed: doc.data().breed,
                        color: doc.data().color,
                        // dob: doc.data().dob,
                        gender: doc.data().gender,
                        marking: doc.data().marking,
                        type: doc.data().pet_type,
                        age: this.calAgePet(doc.data().dob)
                    };
                    console.log(doc.data());
                    this.pets.push(data);

                });
                this.email = firebase.auth().currentUser.email;
                console.log(this.email);
                // console.log(this.pets[0].age)
            });
    },
    mounted() {
        db.collection("users")
            .doc(firebase.auth().currentUser.email)
            .get()
            .then(doc => {
                this.datebirth = doc.data().datebirth,
                    this.calculateAge();
                this.fullname = doc.data().fullname;
                this.lineid = doc.data().line_id;
                this.address = doc.data().address;
                this.password = doc.data().password;
                this.telephone = doc.data().telephone_number;
                this.gender = doc.data().gender;
                console.log("Document data:", doc.data());

            });
    }
};
</script>

<style>
body.body-home {
    background: url("../assets/bg_after.jpg") no-repeat center center fixed;
    -webkit-background-size: cover;
    -moz-background-size: cover;
    -o-background-size: cover;
    background-size: cover;
}

h6 {
    line-height: 1.7;
}

.home-owner {
    margin-top: 3.5em;
}

.btn-label {
    background-color: #e8c547 !important;
    font-weight: 400;
    transition: transform 0.3s;
    padding-top: 0.5%;
    padding-bottom: 0.5%;
    padding-left: 1%;
    padding-right: 1%;
    border-radius: 10px;
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
.image-upload {
    text-align: center;
}

.image-upload>input {
    display: none;
}

.image-upload img {
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
.popup-profile {
    border-radius: 100px;
}

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

/*Edit md width for each platform, .col flex basis removed.*/

/*Common Mobile Portrait*/
@media only screen and (min-width: 370px) and (max-width: 600px) {
    .home-owner {
        margin-top: 10em;
        display: flex;
        align-items: center;
        justify-content: center;
        margin-bottom: 11em;
    }

    .intro-section .btn {
        width: 100%;
    }

    .intro-section .btn.btn-label {
        left: 32%;
        width: 9em;
        border-radius: 15px;
        height: 3em;
    }

    h3.content-label {
        left: 10%;
    }

    .col-md-8 {
        flex-basis: unset;
    }
}

/*Samsung Galaxy S5 and iPhone 5 Portrait*/
@media only screen and (max-width: 360px) and (max-height: 640px) and (orientation: portrait) {
    .home-owner {
        margin-top: 10em;
        display: flex;
        align-items: center;
        justify-content: center;
        margin-bottom: 11em;
    }

    .intro-section .btn {
        width: 100%;
    }

    .intro-section .btn.btn-label {
        left: 32%;
        width: 9em;
        border-radius: 15px;
        height: 3em;
    }

    h3.content-label {
        left: 10%;
    }

    .col-md-8 {
        flex-basis: unset;
    }
}

/*iPhone 5/SE Portrait Button Fix*/
@media only screen and (max-width: 320px) and (max-height: 570px) and (orientation: portrait) {
    .btn.btn-primary {
        padding-bottom: 2px;
        padding-top: 7px;
    }

    .btn.btn-secondary {
        width: 50%;
    }
}

/*iPad Portrait*/
@media only screen and (min-width: 760px) and (orientation: portrait) {
    .intro-section .btn {
        width: 70%;
    }

    .intro-section .btn.btn-label {
        left: 26%;
        width: 9em;
        border-radius: 15px;
        height: 5em;
    }

    h3.content-label {
        left: 17%;
    }

    .col-md-8 {
        left: 4%;
    }

    .col {
        flex-basis: unset;
    }
    .home-owner{
        height: 56em;
    }
}

/*iPad Pro Portrait*/
@media only screen and (min-width: 1000px) and (orientation: portrait) {
    .intro-section .btn.btn-label {
        left: 28%;
    }
    .home-owner{
        height: 77em;
    }
}

/*Common Mobile Landscape*/
@media only screen and (max-width: 830px) and (orientation: landscape) {
    .home-owner {
        height: 30em;
    }

    .intro-section .btn {
        width: 50%;
    }

    .intro-section .btn.btn-label {
        width: 6em;
        height: 3em;
        border-radius: 15px;
    }

    h3.content-label {
        left: 27%;
    }

    .col-md-8 {
        flex-basis: unset;
    }
}

/*Samsung Galaxy S5 and iPhone 5/SE Landscape*/
@media only screen and (max-width: 640px) and (max-height: 360px) and (orientation: landscape) {
    .home-owner {
        height: 35em;
    }

    .intro-section .btn {
        width: 70%;
    }

    .intro-section .btn.btn-label {
        left: 26%;
        width: 6em;
        border-radius: 10px;
        height: 3em;
    }

    h3.content-label {
        left: 17%;
    }

    .col-md-8 {
        flex-basis: unset;
    }
}

/*Common Responsive Landscape, Tablet*/
@media only screen and (min-width: 700px) and (max-height: 1024px) and (orientation: Landscape) {
  .home-owner{
    height: 56em;
  }
}


/*Pixel 2XL and iPhone X Landscape*/
@media only screen and (min-width: 810px) and (max-height: 420px) and (orientation: landscape) {
    .home-owner {
        height: 30em;
    }

    .intro-section .btn.btn-label {
        left: 19%;
        border-radius: 10px;
    }

    h3.content-label {
        left: 26%;
    }

    .col {
        flex-basis: unset;
    }

    .col-md-8 {
        left: 4%;
    }
}

/* Show more style */
.read-more-state {
    display: none;
}

.read-more-target {
    /* opacity: 0; */
    max-height: 0;
    font-size: 0;
    display: none;
    -webkit-animation: fadeOut 1s;
    animation: fadeOut 1s;
}

.read-more-wrap {
    display: none;
}

.read-more-state:checked~.read-more-wrap .read-more-target {
    /* opacity: 1; */
    font-size: inherit;
    max-height: 999em;
    display: block;
    -webkit-animation: fadeIn 0.5s;
    animation: fadeIn 0.5s;
}

.read-more-state:checked~.read-more-wrap {
    /* opacity: 1; */
    font-size: inherit;
    max-height: 999em;
    display: block;
    -webkit-animation: fadeIn 0.5s;
    animation: fadeIn 0.5s;
}

.read-more-state~.read-more-trigger:before {
    content: "\2B9F";
}

.read-more-state:checked~.read-more-trigger:before {
    content: "\2B9D";
}

.read-more-trigger {
    cursor: pointer;
    display: inline-block;
    padding: 0 0.5em;
    color: white;
    font-size: 0.9em;
    line-height: 2;
    border: 4px solid #ddd;
    border-radius: 50%;
    transition: transform 0.2s;
    margin-top: 6px;
    -webkit-animation: fadeIn 1s;
    animation: fadeIn 1s;
}

.read-more-trigger:hover {
    transform: scale(1.2);
    background-color: hsla(360, 100%, 100%, 0.35);
}

@-webkit-keyframes fadeIn {
    from {
        opacity: 0;
    }

    to {
        opacity: 1;
    }
}

@keyframes fadeIn {
    from {
        opacity: 0;
    }

    to {
        opacity: 1;
    }
}

@-webkit-keyframes fadeOut {
    from {
        opacity: 1;
    }

    to {
        opacity: 0;
    }
}

@keyframes fadeOut {
    from {
        opacity: 1;
    }

    to {
        opacity: 0;
    }
}

/* Show more style */

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

input[type="checkbox"]:hover+label:before,
input[type="radio"]:hover+label:before {
    border-color: #999;
}

input[type="checkbox"]:active+label:before,
input[type="radio"]:active+label:before {
    transition-duration: 0;
    filter: brightness(0.2);
}

input[type="checkbox"]+label,
input[type="radio"]+label {
    position: relative;
    padding-left: 26px;
    font-weight: normal;
}

input[type="checkbox"]+label:before,
input[type="checkbox"]+label:after,
input[type="radio"]+label:before,
input[type="radio"]+label:after {
    box-sizing: content-box;
    position: absolute;
    content: "";
    display: block;
    left: 0;
}

input[type="checkbox"]+label:before,
input[type="radio"]+label:before {
    top: 50%;
    width: 16px;
    height: 16px;
    margin-top: -10px;
    border: 2px solid #d9d9d9;
    text-align: center;
}

input[type="checkbox"]+label:after,
input[type="radio"]+label:after {
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

input[type="radio"]:checked+label:before {
    -moz-animation: borderscale 300ms ease-in;
    -webkit-animation: borderscale 300ms ease-in;
    animation: borderscale 300ms ease-in;
    background-color: #fff;
}

input[type="radio"]:checked+label:after {
    transform: scale(1);
}

input[type="radio"]+label:before,
input[type="radio"]+label:after {
    border-radius: 50%;
}

input[type="checkbox"]+label:after {
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

input[type="checkbox"]:checked+label:before {
    -moz-animation: borderscale 200ms ease-in;
    -webkit-animation: borderscale 200ms ease-in;
    animation: borderscale 200ms ease-in;
}

input[type="checkbox"]:checked+label:after {
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
</style>
