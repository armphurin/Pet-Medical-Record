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

                    <div v-for="q in query" v-bind:key="q.fullname" class="news" v-if="(q.user_type == 'vet' && search_filter == 'veterinary') || (q.user_type == 'vet' && search_filter == 'hospital')">
                        <mdb-row>
                            <mdb-col md="3">
                                <mdb-view hover rounded class="z-depth-1-half mb-4">
                                    <img class="img-fluid" :src="q.img" v-if="q.img" alt="Sample image"/>
                                    <img class="img-fluid" src="../assets/pic_owner.png" v-if="!q.img" alt="Sample image"/>
                                    <a>
                  <mdb-mask overlay="white-slight" class="waves-light"/>
                </a>
                                </mdb-view>
                            </mdb-col>
                            <mdb-col md="9">
                                <h4 class="font-weight-bold dark-grey-text">{{q.fullname}}</h4>
                                <div class="d-flex justify-content-between">
                                    <mdb-col col="9" class="text-truncate pl-0 mb-3">
                                        <p class="dark-grey-text" style="margin-bottom:0px;" v-if="q.user_type =='vet'">Veterinary ID: {{q.vet_id}} </p>
                                        <p class="dark-grey-text" v-if="q.user_type == 'vet'">Hospital Adress: {{q.address}}</p>
                                    </mdb-col>
                                    <mdb-col col="3">
                                        <a v-if="owner_user && search_filter != 'owner'"><mdb-btn color="info" @click.native="addfriend(q.id)">Add Friend</mdb-btn></a>
                                        <a v-else-if="owner_user && search_filter == 'owner'"><mdb-btn color="info" @click.native="addfriend(q.id)">Add Friend</mdb-btn></a>
                                        <a v-else :href="'tel:'+q.tel"><mdb-btn color="info">Call</mdb-btn></a>
                                    </mdb-col>
                                </div>
                            </mdb-col>
                        </mdb-row>
                    </div>

                    <div v-for="q in query" v-bind:key="q.id" class="news" v-if="(q.user_type == 'owner' && search_filter == 'owner')">
                        <mdb-row>
                            <mdb-col md="3">
                                <mdb-view hover rounded class="z-depth-1-half mb-4">
                                    <img class="img-fluid" :src="q.img" v-if="q.img" alt="Sample image"/>
                                    <img class="img-fluid" src="../assets/pic_owner.png" v-if="!q.img" alt="Sample image"/>
                                    <a>
                  <mdb-mask overlay="white-slight" class="waves-light"/>
                </a>
                                </mdb-view>
                            </mdb-col>
                            <mdb-col md="9">
                                <h4 class="font-weight-bold dark-grey-text">{{q.fullname}}</h4>
                                <div class="d-flex justify-content-between">
                                    <mdb-col col="9" class="text-truncate pl-0 mb-3">
                                        <p class="dark-grey-text" style="margin-bottom:0px;">Line ID: {{q.line_id}}</p>
                                        <p class="dark-grey-text">Address: {{q.address}}</p>
                                    </mdb-col>
                                    <mdb-col col="3">
                                        <a v-if="owner_user && search_filter != 'owner'"><mdb-btn color="info" @click.native="addfriend(q.id)">Add Friend</mdb-btn></a>
                                        <a v-else-if="vet_user && search_filter == 'owner'"><mdb-btn color="info" @click.native="addfriend(q.id)">Add Friend</mdb-btn></a>
                                        <a v-else :href="'tel:'+q.tel"><mdb-btn color="info">Call</mdb-btn></a>
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
import db from "./firebaseInit";
import firebase from "firebase";

export default {
    beforeCreate: function () {
        document.body.className = "body-searchpage";
    },
    name: 'search-page',
    data: function () {
        return {
            query: [],
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
    methods: {
    addfriend(id) {
        // console.log(id)
        var current = firebase.auth().currentUser.email;
        db.collection("users").doc(id).update({
            
        })
    }
  },
    created() {
        var userRef = db.collection("users")
        var query = userRef.where("fullname", "==", this.search_text)
        query.get().then(querySnapshot => {
            querySnapshot.forEach(doc => {
                const data = {
                    id: doc.id,
                    fullname: doc.data().fullname,
                    line_id: doc.data().line_id,
                    user_type: doc.data().user_type,
                    tel: doc.data().telephone_number,
                    address: doc.data().address,
                    vet_id: doc.data().vet_id,
                    img: doc.data().urlImageProfile,
                    friend_req: doc.data().friend_req
                }
                console.log(data.friend_req)
                this.query.push(data);
            })
            // console.log(this.query.friend_req)
        });
    }

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
