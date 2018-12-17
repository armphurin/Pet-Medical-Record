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
                    <a class="light-blue-text"><h6 class="font-weight-bold"><mdb-icon icon="street-view" class="pr-2"/>Veterinary</h6></a>
                    <p class="font-weight-bold dark-grey-text">
                        <mdb-icon icon="clock-o" class="pr-2" />20/08/2018</p>
                </div>
                <div class="d-flex justify-content-between">
                    <h3 class="font-weight-bold dark-grey-text mb-3 p-0"><a>Friend Request</a></h3>
                </div>
            </div>

            <div class="news">
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
                                <mdb-btn color="primary">Accepted</mdb-btn>
                                <mdb-btn color="danger">Decline</mdb-btn>
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

};
</script>
<style>
body.body-friendpage {
    background: url("../assets/bg_search.jpg") no-repeat center center fixed;
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
</style>
