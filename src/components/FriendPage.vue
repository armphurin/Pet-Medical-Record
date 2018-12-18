<template>
  <mdb-card class="searchcard">
    <mdb-card-body>
<mdb-container>
    <mdb-row>
        <mdb-col lg="12" md="12">
            <h3 class="font-weight-bold light-blue-text mb-3 p-0 text-center"><a>Friend Request and Accepted</a></h3>
            <hr>
            <div class="news">
                <div class="d-flex justify-content-between">
                    <a class="light-blue-text">
                        <h6 v-if="owner_user" class="font-weight-bold"><mdb-icon icon="street-view" class="pr-2"/>Veterinary</h6>
                        <h6 v-if="vet_user" class="font-weight-bold"><mdb-icon icon="street-view" class="pr-2"/>Owner</h6>
                    </a>
                    <p class="font-weight-bold dark-grey-text">
                        <mdb-icon icon="clock-o" class="pr-2" />20/08/2018</p>
                </div>
                <div class="d-flex justify-content-between">
                    <h3 class="font-weight-bold dark-grey-text mb-3 p-0"><a>Friend Request</a></h3>
                </div>
            </div>

            <div class="news" id="req1">
                <mdb-row>
                    <mdb-col md="3">
                        <mdb-view hover rounded class="z-depth-1-half mb-4">
                            <img class="img-fluid" src="https://mdbootstrap.com/img/Photos/Others/photo8.jpg" alt="Sample image"/>
                            <a>
                  <mdb-mask overlay="white-slight" class="waves-light"/>
                </a>
                        </mdb-view>
                    </mdb-col>
                    <mdb-col md="9">
                        <h4 class="font-weight-bold dark-grey-text">Sattaya Singkul</h4>
                        <div class="d-flex justify-content-between">
                            <mdb-col col="8" class="text-truncate pl-0 mb-3">
                                <p class="dark-grey-text" style="margin-bottom:0px;">Veterinary ID: 696969696</p>
                                <p class="dark-grey-text">Hospital: Mahidol Hospital</p>
                            </mdb-col>
                            <mdb-col col="4" style="display:inline-grid">
                                <mdb-btn color="primary">Accept</mdb-btn>
                                <mdb-btn color="danger" @click.native="deleteRequest($event)">Decline</mdb-btn>
                            </mdb-col>
                        </div>
                    </mdb-col>
                </mdb-row>
            </div>

            <div class="news">
                <div class="d-flex justify-content-between">
                    <a class="light-blue-text"><h6 class="font-weight-bold"><mdb-icon icon="address-book-o" class="pr-2"/>Veterinary</h6></a>
                    <p class="font-weight-bold dark-grey-text">
                        <mdb-icon icon="clock-o" class="pr-2" />20/08/2018</p>
                </div>
                <div class="d-flex justify-content-between">
                    <h3 class="font-weight-bold dark-grey-text mb-3 p-0"><a>Friend Accepted</a></h3>
                </div>
            </div>

            <div class="news">
                <mdb-row>
                    <mdb-col md="3">
                        <mdb-view hover rounded class="z-depth-1-half mb-4">
                            <img class="img-fluid" src="https://mdbootstrap.com/img/Photos/Others/images/54.jpg" alt="Sample image"/>
                            <a>
                  <mdb-mask overlay="white-slight" class="waves-light"/>
                </a>
                        </mdb-view>
                    </mdb-col>
                    <mdb-col md="9">
                        <h4 class="font-weight-bold dark-grey-text">Phurin Setanya</h4>
                        <div class="d-flex justify-content-between">
                            <mdb-col col="11" class="text-truncate pl-0 mb-3">
                                <p class="dark-grey-text" style="margin-bottom:0px;">Case: Pet_Name</p>
                                <p class="dark-grey-text" style="margin-bottom:0px;">Veterinary ID: 696969696</p>
                                <p class="dark-grey-text" style="margin-bottom:0px;">Hospital: Setanya Hospital</p>
                                <p class="dark-grey-text">Telephone: 08123456</p>
                            </mdb-col>
                            <a href="tel:+6494461709"><mdb-icon icon="phone"/></a>
                        </div>
                    </mdb-col>
                </mdb-row>
            </div>

            <div class="mb-4">
                <mdb-row>
                    <mdb-col md="3">
                        <mdb-view hover rounded class="z-depth-1-half mb-4">
                            <img class="img-fluid" src="https://mdbootstrap.com/img/Photos/Others/images/49.jpg" alt="Sample image"/>
                            <a>
                  <mdb-mask overlay="white-slight" class="waves-light"/>
                </a>
                        </mdb-view>
                    </mdb-col>
                    <mdb-col md="9">
                        <h4 class="font-weight-bold dark-grey-text">Nai Thana</h4>
                        <div class="d-flex justify-content-between">
                            <mdb-col col="11" class="text-truncate pl-0 mb-3">
                                <p class="dark-grey-text" style="margin-bottom:0px;">Case: Pet_Name</p>
                                <p class="dark-grey-text" style="margin-bottom:0px;">Veterinary ID: 696969696</p>
                                <p class="dark-grey-text" style="margin-bottom:0px;">Hospital: Yala Hospital</p>
                                <p class="dark-grey-text">Telephone: 08123456</p>
                            </mdb-col>
                            <a href="tel:+6494461709"><mdb-icon icon="phone"/></a>
                        </div>
                    </mdb-col>
                </mdb-row>
            </div>
        </mdb-col>
    </mdb-row>
</mdb-container>
    </mdb-card-body>
  </mdb-card>
</template>

<script>
import {
    mdbContainer,
    mdbRow,
    mdbCol,
    mdbView,
    mdbIcon,
    mdbMask,
    mdbBadge,
          mdbCard,
      mdbCardImage,
      mdbCardBody,
      mdbCardTitle,
      mdbCardText,
      mdbBtn
} from 'mdbvue';

export default {
      beforeCreate: function() {
    document.body.className = "body-friendpage";
  },
    name: 'friend-page',
    data: function () {
    return {
            owner_user: JSON.parse(localStorage.getItem("ownerUser")),
            vet_user: JSON.parse(localStorage.getItem("vetUser"))
        };
    },
    components: {
        mdbContainer,
        mdbRow,
        mdbCol,
        mdbView,
        mdbIcon,
        mdbMask,
        mdbBadge,
              mdbCard,
      mdbCardImage,
      mdbCardBody,
      mdbCardTitle,
      mdbCardText,
      mdbBtn
    },
    methods:{
        deleteRequest(e) {
            // alert("section");
            // this.selected = true;
            e.target.className += " deleteRequest";
            document.getElementById("req1").className += " deleteRequest"
            alert(e.target.className);
            alert(document.getElementById("req1"));
        }
    }

};
</script>
<style>
body.body-friendpage {
    background: url("../assets/bg_friend.jpg") no-repeat center center fixed;
    -webkit-background-size: cover;
    -moz-background-size: cover;
    -o-background-size: cover;
    background-size: cover;
}
</style>

<style scoped>
.news {
    border-bottom: 1px solid #e0e0e0;
    margin-bottom: 1.5rem;
}
.card.searchcard{
    margin-top: 5em;
}

/* fade hiddem */
.deleteRequest{
    /* display:none; */
    animation: delete-fadeout .3s ease-out;
}

.text-truncate{
    overflow: visible;
}

/*Common Mobile Portrait*/
@media only screen and (min-width: 370px) and (max-width: 600px) {
    .col-4{
        left: -73%;
        margin-top: 3em;
        margin-bottom: 1.5em;
    }
    .col-4 .btn{
        width: 10em;
    }
}

/*Samsung Galaxy S5 and iPhone 5 Portrait*/
@media only screen and (max-width: 360px) and (max-height: 640px) and (orientation: portrait) {
    .col-4{
        left: -75%;
        margin-top: 3em;
        margin-bottom: 1.5em;
    }
    .col-4 .btn{
        width: 10em;
    }  
}

/*iPad Portrait*/
@media only screen and (min-width: 760px) and (orientation: portrait) {
    .col-4 .btn{
        width: 10em;
    }  
}

/*iPad Pro Portrait*/
@media only screen and (min-width: 1000px) and (orientation: portrait) {
    .footer-copyright{
        margin-top: 24em;
    }
}

/*Common Landscape*/
@media only screen and (max-width: 830px) and (orientation: landscape) {
    .col-4 .btn{
        width: 10em;
    }  
}

@-webkit-keyframes delete-fadeout {
      0% { opacity: 1; -webkit-transform: translateY(0); }   
    100% { opacity: 0; -webkit-transform: translateY(-100%); }
}

</style>
