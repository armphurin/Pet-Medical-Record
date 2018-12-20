<template>
<div>
    <header>
        <!--ViewWrapper-->
        <view-wrapper class="contact">
            <md-mask class="d-flex justify-content-center align-items-center">
                <container>
                    <!--Grid row-->
                    <row class="pt-lg-5 mt-lg-5">
                        <!--Grid column-->
                        <column md="6" xl="5" class="mb-4">
                            <!--Form-->
                            <card>
                                <card-body class="z-depth-2">
                                    <!--Header-->
                                    <div class="text-center">
                                        <h3 class="dark-grey-text">
                                            <strong>Write to us:</strong>
                                        </h3>
                                        <hr>
                                    </div>
                                    <!--Body-->
                                    <div class="md-form">
                                        <!--Input with icon prefix-->
                                        <mdb-input type="text" icon="user" iconClass="grey-text" label="Topic Contact" id="form-topic" v-model="topic" />
                                        <mdb-input type="text" icon="envelope" iconClass="grey-text" label="Your mail" id="form-email" v-model="email" />
                                        <!--Textarea with icon prefix-->
                                        <md-textarea icon="pencil" iconClass="grey-text" label="Your Contact Detail" id="form-detail"  v-model="detial" />
                                    </div>
                                    <div class="text-center mt-3">
                                        <btn color="dark-green" @click.native="sendcontact">Send</btn>
                                        <hr>
                                        <fieldset class="form-check">
                                            <mdb-input type="checkbox" label="Subscribe me to the newsletter" id="form-subscribe" v-model="check" inline />
                                        </fieldset>
                                    </div>
                                </card-body>
                            </card>
                            <!--/.Form-->
                        </column>
                        <!--Grid column-->
                        <!--Grid column-->

                        <!--Grid column-->
                    </row>
                    <!--Grid row-->
                </container>
            </md-mask>
        </view-wrapper>
        <!--/.ViewWrapper-->
    </header>
</div>
</template>

<script>
import {
    Navbar,
    NavbarCollapse,
    NavbarNav,
    NavbarItem,
    mdbInput,
    MdTextarea,
    ViewWrapper,
    MdMask,
    Row,
    Column,
    Container,
    Btn,
    Card,
    CardBody,
    mdbNavbarBrand
} from "mdbvue";
import firebase from "firebase";
import swal from "sweetalert2";
export default {
    beforeCreate: function () {
        document.body.className = "body-contact";
    },
    name: "contact",
    data: function () {
        return {
            topic: "",
            email: "",
            detial: "",
            check: "",
            user: "",
        };
    },
    components: {
        Navbar,
        NavbarCollapse,
        NavbarNav,
        NavbarItem,
        mdbInput,
        MdTextarea,
        ViewWrapper,
        MdMask,
        Row,
        Column,
        Container,
        Btn,
        Card,
        CardBody,
        mdbNavbarBrand
    },
    methods: {
        sendcontact() {
            swal({
                title: "Loading ...",
                onOpen: () => {
                    swal.showLoading();
                }
            });
            if (this.checkinput()) {
                swal({
                    title: "Submit Status",
                    text: `You has been sent your topic as ${this.email}`,
                    type: "success",
                    showConfirmButton: false,
                    timer: 3000,
                     onOpen: () => {
                        swal.hideLoading();
                      }
                })
                // console.log(this.email, this.topic, this.detial)
                
            }
            if (!this.checkinput()) {
                swal({
                    title: "Submit Status",
                    text: `Please fill out empty field`,
                    type: "error",
                    showConfirmButton: false,
                    timer: 3000,
                    onOpen: () => {
                        swal.hideLoading();
                      }
                })
                // console.log(this.email, this.topic, this.detial)
            }

        },
        checkinput(){
          if(!this.email){
            return false;
          }
          if(!this.topic){
            return false;
          }
          if(!this.detial){
            return false;
          }
          else{
            return true;
          }
          
        }
    }
};
</script>

<style>
body.body-contact {
    background: url("../assets/bg_contact.png") no-repeat center center fixed;
    -webkit-background-size: cover;
    -moz-background-size: cover;
    -o-background-size: cover;
    background-size: cover;
}
</style><style scoped>
.view.contact {
    background-image: url("");
    background-repeat: no-repeat;
    background-size: cover;
    background-position: center center;
    height: calc(100vh - 60px);
}

h6 {
    line-height: 1.7;
}

@media only screen and (max-width: 360px) {
    .view.contact {
        margin-top: 1.5em;
    }

    .intro-section .btn {
        padding-left: 2rem;
        padding-right: 2rem;
    }
}

@media only screen and (min-width: 370px) and (max-width: 600px) {
    .view.home-page {
        margin-top: 2em;
    }
}

/*-----Mobile Device Edit-----*/

/*Common Mobile Portrait*/
@media only screen and (min-width: 360px) and (max-width: 600px) and (orientation: portrait) {
    .view.contact {
        margin-top: 3em;
    }

    .card {
        top: 1.5em;
    }

    .form-check {
        width: 20em;
        left: -25px;
    }

    #form-subscribe.form-check.form-check-input {
        /*Still Error*/
        width: 15px;
        left: 18em;
        top: 0.15em;
    }
}

/*iPhone 5/SE Portrait*/
@media only screen and (max-width: 320px) and (max-height: 570px) and (orientation: portrait) {
    .view.contact {
        height: 40em;
    }

    .form-check {
        width: 18em;
        left: -25px;
    }
}

/*Common Mobile Landscape*/
@media only screen and (max-width: 830px) and (orientation: landscape) {
    .view.contact {
        height: 40em;
    }
}

/*Pixel 2XL and iPhone X Landscape*/
@media only screen and (min-width: 810px) and (max-height: 420px) and (orientation: landscape) {
    .card {
        width: 41.5em;
    }
}
</style>
