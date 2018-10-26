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
import { Navbar, NavbarCollapse, NavbarNav, NavbarItem, mdbInput, MdTextarea, ViewWrapper, MdMask, Row, Column, Container, Btn, Card, CardBody, mdbNavbarBrand } from 'mdbvue';
import firebase from 'firebase';
export default {
  name: 'contact',
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
html{
  background-size: cover;
  height: 100%;
  -webkit-background-size: cover;
  -moz-background-size: cover;
  -o-background-size: cover;
  background-size: cover;
  background-repeat:no-repeat;
  background: rgb(52,160,217); /* Old browsers */
  background: -moz-linear-gradient(top, rgb(52,160,217) 0%, rgb(23,169,149) 56%, rgb(23,169,149) 100%); /* FF3.6-15 */
  background: -webkit-linear-gradient(top, rgb(52,160,217) 0%,rgb(23,169,149) 56%,rgb(23,169,149) 100%); /* Chrome10-25,Safari5.1-6 */
  background: linear-gradient(to bottom, rgb(52,160,217) 0%,rgb(23,169,149) 56%,rgb(23,169,149) 100%); /* W3C, IE10+, FF16+, Chrome26+, Opera12+, Safari7+ */
  filter: progid:DXImageTransform.Microsoft.gradient( startColorstr='#34a0d9', endColorstr='#17a995',GradientType=0 ); /* IE6-9 */
}
body { 
    background-color: transparent;
}

.view.contact {
  background-image: url('');
  background-repeat: no-repeat;
  background-size: cover;
  background-position: center center;
  height: calc(100vh - 60px);
}
h6 {
  line-height: 1.7;
}

@media only screen and (max-width: 360px) {
  .view.contact{
    margin-top: 1.5em;
  }
  .intro-section .btn{
    padding-left: 2rem;
    padding-right: 2rem;
  }
}

@media only screen and (min-width: 370px) and (max-width: 600px){
  .view.home-page{
    margin-top: 2em;
  }
}



</style>
