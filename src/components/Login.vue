<template>
<div class="wrapper">
    <view-wrapper>
        <container class="px-md-3 px-sm-0">
            <form action="index.html" class="login_content">
                <row>
                    <img src="../assets/logo.png" alt="Pet Medic" class="logo_login">
          </row>
                    <row class="areaDistance">
                        <input class="form-control form-control-lg" type="email" placeholder="email" id="email" v-model="email" style="width:300px;margin: 0 auto;border-radius: 13px;">
          </row>
                        <row class="areaDistance">
                            <input class="form-control form-control-lg" type="password" placeholder="password" id="password" v-model="password" style="width:300px;margin: 0 auto;border-radius: 13px;">
          </row>
                            <row class="areaDistance">
                                <!-- <btn v-on:click="login" type="button" color="elegant" style="width:300px;margin: 0 auto;border-radius: 13px;">Login</btn> -->
                                <button v-on:click="login" class="btn btn-elegant" style="width:300px;margin: 0 auto;border-radius: 13px;">Login</button>
                            </row>
            </form>
        </container>
    </view-wrapper>

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

} from "mdbvue";

import firebase from "firebase";
// ES6 Modules or TypeScript
import swal from "sweetalert2";

export default {
    beforeCreate: function () {
        document.body.className = "body-login";
    },
    name: "login",
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
    },
    data: function () {
        return {
            email: "",
            password: "",
            text: ""
        };
    },
    methods: {
        login: function (e) {
            swal({
                title: 'Loading ...',
                onOpen: () => {
                    swal.showLoading()
                }
            });
            firebase
                .auth()
                .signInWithEmailAndPassword(this.email, this.password)
                .then(
                    user => {
                        swal({
                            title: "Login Status",
                            text: `You are logged in as ${user.email}`,
                            type: "success",
                            showConfirmButton: false,
                            timer: 1500,
                            onOpen: () => {
                                swal.hideLoading()
                            }
                        }).then(result => {

                            this.$router.go({
                                path: this.$router.path
                            });

                        });
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
    }
};
</script>

<style>
body.body-login {
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
</style>


<style scoped>
body.body-login {
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

form {
    position: relative;
    z-index: 2;
}

form.login_content {
    margin-top: 12%;
    position: relative;
    z-index: 2;
}

.logo_login {
    width: 28%;
    height: 28%;
    min-width: 250px;
    margin: 0 auto;
}

.areaDistance {
    margin-top: 2%;
    margin-bottom: 2%;
}

/*For mobile Portrait*/
@media only screen and (max-width: 600px) and (orientation: portrait) {
  form.login_content {
    margin-top: 40%;
  }
}

/*For mobile Landscape including Pixel2XL. iPhoneX*/
@media only screen and (max-width: 830px) and (max-height: 420px) and (orientation: landscape) {
    form.login_content {
        margin-top: 2.5em;
    }
}

/*For iPhone5/SE */
@media only screen and (max-width: 570px) and (max-height: 330px) and (orientation: landscape) {
    form.login_content {
        padding-left: 170px;
        margin-top: 2.5em;
        width: 230px;
    }

    .logo_login {
        height: 120px;
    }

    button.btn {
        padding-left: 110px;
        padding-right: 110px;
    }
}
</style>
