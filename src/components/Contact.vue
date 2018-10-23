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
                <column md="6" class="mb-5 mt-md-0 mt-5 white-text text-center text-md-left">
                  <h1 class="display-4 font-weight-bold">Lorem ipsum</h1>
                  <hr class="hr-light">
                  <h6 class="mb-3">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Rem repellendus quasi fuga
                  nesciunt dolorum nulla magnam veniam sapiente, fugiat! Commodi sequi non animi ea
                  dolor molestiae, quisquam iste.</h6>
                  <btn outline="white">Learn more</btn>
                </column>
                <!--Grid column-->
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
                        <mdb-input type="text" icon="user" iconClass="grey-text" label="Your name" id="form-name"/>
                        <mdb-input type="text" icon="envelope" iconClass="grey-text" label="Your mail" id="form-email"/>
                        <!--Textarea with icon prefix-->
                        <md-textarea icon="pencil" iconClass="grey-text" label="Your message" id="form-text" :rows="3"/>
                      </div>
                      <div class="text-center mt-3">
                        <btn color="indigo">Send</btn>
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
</style>
