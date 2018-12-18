<template>
<mdb-card class="searchcard">
    <mdb-card-body>
        <mdb-container>
            <mdb-row>
                <mdb-col lg="12" md="12">
                    <div class="news">
                        <div class="d-flex justify-content-between">
                            <a class="light-blue-text">
                        <h6 v-if="search_filter == 'veterinary'" class="font-weight-bold"><mdb-icon icon="street-view" class="pr-2"/>Veterinary</h6>
                        <h6 v-else-if="search_filter == 'hospital'" class="font-weight-bold"><mdb-icon icon="hotel" class="pr-2"/>Hospital</h6>
                        <h6 v-else-if="search_filter == 'owner'" class="font-weight-bold"><mdb-icon icon="street-view" class="pr-2"/>Owner</h6>
                        </a>
                            <p class="font-weight-bold dark-grey-text">
                                <mdb-icon icon="clock-o" class="pr-2" />20/08/2018</p>
                        </div>
                        <div class="d-flex justify-content-between">
                            <h3 class="font-weight-bold dark-grey-text mb-3 p-0"><a>Search Result</a></h3>
                            <select v-model="search_filter" class="browser-default custom-select mb-3" style="width:20%;">
  <option selected value="veterinary">Veterinary</option>
  <option value="hospital">Hospital</option>
  <option value="owner">Owner</option>
</select>
                        </div>
                        <p class="dark-grey-text">Search result for <b>{{search_text}}</b></p>
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
                                    <mdb-col col="9" class="text-truncate pl-0 mb-3">
                                        <p class="dark-grey-text" style="margin-bottom:0px;">Veterinary ID: 696969696</p>
                                        <p class="dark-grey-text">Hospital: Mahidol Hospital</p>
                                    </mdb-col>
                                    <mdb-col col="3">
                                        <a v-if="owner_user && search_filter != 'owner'"><mdb-btn color="info">Add Friend</mdb-btn></a>
                                        <a v-else-if="vet_user && search_filter == 'owner'"><mdb-btn color="info">Add Friend</mdb-btn></a>
                                        <a v-else href="tel:+688912456"><mdb-btn color="info">Call</mdb-btn></a>
                                    </mdb-col>
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
                                    <mdb-col col="9" class="text-truncate pl-0 mb-3">
                                        <p class="dark-grey-text" style="margin-bottom:0px;">Veterinary ID: 696969696</p>
                                        <p class="dark-grey-text">Hospital: Setanya Hospital</p>
                                    </mdb-col>
                                    <mdb-col col="3">
                                        <a v-if="owner_user && search_filter != 'owner'"><mdb-btn color="info">Add Friend</mdb-btn></a>
                                        <a v-else-if="vet_user && search_filter == 'owner'"><mdb-btn color="info">Add Friend</mdb-btn></a>
                                        <a v-else href="tel:+688912456"><mdb-btn color="info">Call</mdb-btn></a>
                                    </mdb-col>
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
                                    <mdb-col col="9" class="text-truncate pl-0 mb-3">
                                        <p class="dark-grey-text" style="margin-bottom:0px;">Veterinary ID: 696969696</p>
                                        <p class="dark-grey-text">Hospital: Yala Hospital</p>
                                    </mdb-col>
                                    <mdb-col col="3">
                                        <a v-if="owner_user && search_filter != 'owner'"><mdb-btn color="info">Add Friend</mdb-btn></a>
                                        <a v-else-if="vet_user && search_filter == 'owner'"><mdb-btn color="info">Add Friend</mdb-btn></a>
                                        <a v-else href="tel:+688912456"><mdb-btn color="info">Call</mdb-btn></a>
                                    </mdb-col>
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
    beforeCreate: function () {
        document.body.className = "body-searchpage";
    },
    name: 'search-page',
    data: function () {
        return {
            query: null,
            search_text: localStorage.getItem("search_text"),
            search_filter: "veterinary",
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

};
</script>

<style>
body.body-searchpage {
    background: url("../assets/bg_search.jpg") no-repeat center center fixed;
    -webkit-background-size: cover;
    -moz-background-size: cover;
    -o-background-size: cover;
    background-size: cover;
}
</style><style scoped>
.news {
    border-bottom: 1px solid #e0e0e0;
    margin-bottom: 1.5rem;
}

.card.searchcard {
    margin-top: 5em;
}
</style>
