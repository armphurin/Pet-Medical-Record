<template>
  <mdb-card class="searchcard">
    <mdb-card-body>
<mdb-container>
    <mdb-row>
        <mdb-col lg="12" md="12">
            <div class="news">
                <div class="d-flex justify-content-between">
                    <a class="light-blue-text"><h6 class="font-weight-bold"><mdb-icon icon="plane" class="pr-2"/>Veterinary</h6></a>
                    <p class="font-weight-bold dark-grey-text">
                        <mdb-icon icon="clock-o" class="pr-2" />20/08/2018</p>
                </div>
                <div class="d-flex justify-content-between">
                    <h3 class="font-weight-bold dark-grey-text mb-3 p-0"><a>Search Result</a></h3>
                    <select class="browser-default custom-select mb-3" style="width:20%;">
  <option selected value="veterinary">Veterinary</option>
  <option value="hospital">Hospital</option>
</select>
                </div>
                <p class="dark-grey-text">Search result ...........................................</p>
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
                            <mdb-col col="11" class="text-truncate pl-0 mb-3">
                                <p class="dark-grey-text" style="margin-bottom:0px;">Veterinary ID: 696969696</p>
                                <p class="dark-grey-text">Hospital: Mahidol Hospital</p>
                            </mdb-col>
                            <a><mdb-icon icon="angle-double-right"/></a>
                        </div>
                    </mdb-col>
                </mdb-row>
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
                                <p class="dark-grey-text" style="margin-bottom:0px;">Veterinary ID: 696969696</p>
                                <p class="dark-grey-text">Hospital: Setanya Hospital</p>
                            </mdb-col>
                            <a><mdb-icon icon="angle-double-right"/></a>
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
                                <p class="dark-grey-text" style="margin-bottom:0px;">Veterinary ID: 696969696</p>
                                <p class="dark-grey-text">Hospital: Yala Hospital</p>
                            </mdb-col>
                            <a><mdb-icon icon="angle-double-right"/></a>
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
    document.body.className = "body-searchpage";
  },
    name: 'search-page',
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
body.body-searchpage {
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
  background: -moz-linear-gradient(
    top,
    rgb(52, 160, 217) 0%,
    rgb(23, 169, 149) 56%,
    rgb(23, 169, 149) 100%
  );
  /* FF3.6-15 */
  background: -webkit-linear-gradient(
    top,
    rgb(52, 160, 217) 0%,
    rgb(23, 169, 149) 56%,
    rgb(23, 169, 149) 100%
  );
  /* Chrome10-25,Safari5.1-6 */
  background: linear-gradient(
    to bottom,
    rgb(52, 160, 217) 0%,
    rgb(23, 169, 149) 56%,
    rgb(23, 169, 149) 100%
  );
  /* W3C, IE10+, FF16+, Chrome26+, Opera12+, Safari7+ */
  filter: progid:DXImageTransform.Microsoft.gradient(startColorstr='#34a0d9', endColorstr='#17a995', GradientType=0);
  /* IE6-9 */
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
