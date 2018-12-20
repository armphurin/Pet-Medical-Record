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
                                <mdb-icon icon="clock-o" class="pr-2" />{{timenow()}}</p>
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
                                        <p class="dark-grey-text" v-if="q.user_type == 'vet'">Hospital Adress: {{q.hospital}}</p>
                                    </mdb-col>
                                    <mdb-col col="3">
                                        <a v-if="owner_user && search_filter != 'owner' && (!q.friend_req[current_user] || q.friend_req[current_user] == 'cancel')"><mdb-btn color="info" @click.native="addfriend(q)">Add Friend</mdb-btn></a>
                                        <a v-else-if="owner_user && search_filter == 'owner' && (!q.friend_req[current_user] || q.friend_req[current_user] == 'cancel')"><mdb-btn color="info" @click.native="addfriend(q)">Add Friend</mdb-btn></a>
                                        <a v-else-if="vet_user" :href="'tel:'+q.tel"><mdb-btn color="info">Call</mdb-btn></a>
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
                                        <a v-if="owner_user && search_filter != 'owner'&& (!q.friend_req[current_user] || q.friend_req[current_user] == 'cancel')"><mdb-btn color="info" @click.native="addfriend(q)">Add Friend</mdb-btn></a>
                                        <a v-else-if="vet_user && search_filter == 'owner'&& (!q.friend_req[current_user] || q.friend_req[current_user] == 'cancel')"><mdb-btn color="info" @click.native="addfriend(q)">Add Friend</mdb-btn></a>
                                        <a v-else-if="owner_user" :href="'tel:'+q.tel"><mdb-btn color="info">Call</mdb-btn></a>
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
import swal from "sweetalert2";

export default {
    beforeCreate: function () {
        document.body.className = "body-searchpage";
    },
    name: 'search-page',
    data: function () {
        return {
            query: [],
            current_user: firebase.auth().currentUser.email,
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
    addfriend(q) {
        // console.log(id)
        const toast = swal.mixin({
        toast: true,
        position: "top-end",
        showConfirmButton: false,
        timer: 2000
      });
        q.friend_req[this.current_user] = 'wait'
        console.log(q.friend_req[this.current_user])
        db.collection("users").doc(q.id).update({
            friend_req : q.friend_req
        }).then(user=>{ 
            q.friend_req = {}
            q.friend_req[q.id] = 'sending'
            console.log(q.friend_req)
            db.collection("users").doc(this.current_user).update({
                send_friend_req : q.friend_req
            }).then(user=>{
                console.log(q.friend_req[q.id])
            }).then(user=>{
                this.$router.go(this.$route.path);
            })
        })    
    },
    timenow(){
    var now= new Date(), 
    ampm= 'am', 
    h= now.getHours(), 
    m= now.getMinutes(), 
    s= now.getSeconds();
    if(h>= 12){
        if(h>12) h -= 12;
        ampm= 'pm';
    }

    if(m<10) m= '0'+m;
    if(s<10) s= '0'+s;
    return now.toLocaleDateString()+ ' ' + h + ':' + m + ':' + s + ' ' + ampm;
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
                    friend_req: doc.data().friend_req,
                    send_friend_req: doc.data().send_friend_req,
                    hospital: doc.data().hospital
                }
                this.query.push(data);
            })
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
</style>

<style scoped>
.news {
    border-bottom: 1px solid #e0e0e0;
    margin-bottom: 1.5rem;
}

.card.searchcard {
    margin-top: 5em;
    margin-bottom: 25em;
}

/*Common Mobile Portrait*/
@media only screen and (min-width: 370px) and (max-width: 600px) {
    .col-3{
        left: -72%;
        margin-top: 4em;
        margin-bottom: 1.5em;
    }

    .col-3 .btn{
        width: 7em;
        padding-left: 0px;
        left: -70%;
        padding-right: 0px;
        top: -10%;
    }
}

/*Samsung Galaxy S5 and iPhone 5 Portrait*/
@media only screen and (max-width: 360px) and (max-height: 640px) and (orientation: portrait) {
    .text-truncate{
        overflow: visible;
    }

    .col-3{
        left: -82%;
        margin-top: 4em;
        margin-bottom: 1.5em;
    }

    .col-3 .btn{
        width: 7em;
        padding-left: 0px;
        left: -20%;
        padding-right: 0px;
        top: -10%;
    }  

    .browser-default{
        margin-left: 1em;
    }
}

/*iPad Portrait*/
@media only screen and (min-width: 760px) and (orientation: portrait) {
    .col-3 .btn{
        width: 7em;
        padding-left: 0px;
        padding-right: 0px;
    }

    .searchcard{
        margin-bottom: 38.5%;
    }
}

/*iPad Pro Portrait*/
@media only screen and (min-width: 1000px) and (orientation: portrait) {
    .searchcard{
        margin-bottom: 54%;
    }
}


/*Common Mobile Landscape*/
@media only screen and (max-width: 830px) and (orientation: landscape) {
    .col-3 .btn{
        width: 7em;
        padding-left: 0px;
        padding-right: 0px;
        top: -10%;
    }  
}

/*Samsung Galaxy S5 and iPhone 5/SE Landscape*/
@media only screen and (max-width: 640px) and (max-height: 360px) and (orientation: landscape) {
    .col-3 .btn{
        width: 7em;
        padding-left: 0px;
        padding-right: 0px;
        top: -10%;
    }
}

/*iPro Landscape*/
@media only screen and (min-width: 1200px) and (max-width: 1400px) and (orientation: landscape) {
    .searchcard{
        margin-bottom: 6%;
    }
}

</style>
