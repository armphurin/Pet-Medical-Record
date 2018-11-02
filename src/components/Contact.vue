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
                        <mdb-input type="text" icon="user" iconClass="grey-text" label="Topic Contact" id="form-topic"/>
                        <mdb-input type="text" icon="envelope" iconClass="grey-text" label="Your mail" id="form-email"/>
                        <!--Textarea with icon prefix-->
                        <md-textarea icon="pencil" iconClass="grey-text" label="Your Contact Detail" id="form-detail" :rows="3"/>
                      </div>
                      <div class="text-center mt-3">
                        <btn color="dark-green">Send</btn>
                        <hr>
                        <fieldset class="form-check">
                          <mdb-input type="checkbox" label="Subscribe me to the newsletter" id="form-subscribe" inline/>
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
export default {
  beforeCreate: function() {
    document.body.className = "body-contact";
  },
  name: "contact",
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
</style>


<style scoped>
/* body.body-contact {
  background: url("../assets/bg_contact.png") no-repeat center center fixed;
  -webkit-background-size: cover;
  -moz-background-size: cover;
  -o-background-size: cover;
  background-size: cover;
} */

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

/*-----Mobile Device Edit-----*/

/*Common Mobile Portrait*/
@media only screen and (min-width: 370px) and (max-width: 600px) and (orientation: portrait) {
  .view.contact {
    margin-top: 3em;
  }
}

/*iPhone 5/SE Portrait*/
@media only screen and (max-width: 320px) and (max-height: 570px) and (orientation: portrait) {
  .view.contact {
    height: 40em;
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
