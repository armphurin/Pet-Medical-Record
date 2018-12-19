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

            <div v-for="f in friend_req" v-bind:key="f" v-if="f[1] == 'wait'" class="news">
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
                        <h4 class="font-weight-bold dark-grey-text">{{dump[f[0]].fullname}}</h4>
                        <div class="d-flex justify-content-between">
                            <mdb-col col="8" class="text-truncate pl-0 mb-3">
                                <p class="dark-grey-text" style="margin-bottom:0px;" v-if="dump[f[0]].user_type == 'vet'" >Veterinary ID: {{dump[f[0]].vet_id}}</p>
                                <p class="dark-grey-text" style="margin-bottom:0px;" v-if="dump[f[0]].user_type == 'owner'" >Tel: {{dump[f[0]].tel}}</p>
                                <p class="dark-grey-text" v-if="dump[f[0]].user_type == 'vet'" >Hospital: {{dump[f[0]].hospital}}</p>
                                <p class="dark-grey-text" v-if="dump[f[0]].user_type == 'owner'" >Hospital: {{dump[f[0]].address}}</p>
                            </mdb-col>
                            <mdb-col col="4" style="display:inline-grid">
                                <mdb-btn color="primary" @click.native="acceptFriend(dump[f[0]])">Accept</mdb-btn>
                                <mdb-btn color="danger" @click.native="declineFriend(dump[f[0]])">Decline</mdb-btn>
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

            <div class="news"  v-for="friend in friend_list" v-bind:key="friend" >
                <mdb-row>
                    <mdb-col md="3">
                        <mdb-view hover rounded class="z-depth-1-half mb-4">
                            <img class="img-fluid" src="../assets/pic_owner.png" v-if="!dump[friend].img" alt="Sample image"/>
                            <img class="img-fluid" :src="dump[friend].img" v-if="dump[friend].img" alt="Sample image"/>
                            <a>
                  <mdb-mask overlay="white-slight" class="waves-light"/>
                </a>
                        </mdb-view>
                    </mdb-col>
                    <mdb-col md="9">
                        <h4 class="font-weight-bold dark-grey-text">{{dump[friend].fullname}}</h4>
                        <div class="d-flex justify-content-between">
                            <mdb-col col="11" class="text-truncate pl-0 mb-3">
                                <!-- <p class="dark-grey-text" style="margin-bottom:0px;">Case: Pet_Name</p> -->
                                <p class="dark-grey-text" style="margin-bottom:0px;" v-if="dump[friend].user_type == 'vet'" >Veterinary ID: {{dump[friend].vet_id}} </p>
                                <p class="dark-grey-text" style="margin-bottom:0px;" v-if="dump[friend].user_type == 'owner'" >Tel: {{dump[friend].tel}} </p>
                                <p class="dark-grey-text" style="margin-bottom:0px;" v-if="dump[friend].user_type == 'vet'" >Hospital: {{dump[friend].hospital}}</p>
                                <p class="dark-grey-text" style="margin-bottom:0px;" v-if="dump[friend].user_type == 'owner'" >Address: {{dump[friend].address}}</p>
                            </mdb-col>
                            <a :href="'tel:'+dump[friend].tel"><mdb-icon icon="phone"/></a>
                        </div>
                    </mdb-col>
                </mdb-row>
            </div>

            <!-- <div class="mb-4">
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
            </div> -->
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
import { firestore } from 'firebase';
import firebase from "firebase";
import db from "./firebaseInit"

export default {
    name: 'friend-page',
    data: function () {
    return {
            current_user: firebase.auth().currentUser.email,
            owner_user: JSON.parse(localStorage.getItem("ownerUser")),
            vet_user: JSON.parse(localStorage.getItem("vetUser")),
            friend_req : null,
            keys : null,
            dump : {},
            friend_list : [],
            f_r : null
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
        acceptFriend(doc) {
            
            this.friend_list.push(doc.id);
            this.f_r[doc.id] = 'accept';
            // console.log(this.f_r)
            db.collection("users").doc(this.current_user).update({
                friend_list : this.friend_list,
                friend_req : this.f_r
            }).then(user=>{
                var new_friend_list = doc.friend_list;
                var new_send_req = doc.send_req;
                new_friend_list.push(this.current_user);
                new_send_req[this.current_user] = 'accept';
                db.collection("users").doc(doc.id).update({
                    send_friend_req : new_send_req,
                    friend_list : new_friend_list
                })
            }).then(user=>{
                this.$router.go(this.$route.path);
            })
        },
        declineFriend(doc) {
            this.f_r[doc.id] = 'cancel';
            db.collection("users").doc(this.current_user).update({
                friend_req : this.f_r
            }).then(user=>{
                var new_send_req = doc.send_req;
                console.log(new_send_req)
                new_send_req[this.current_user] = 'cancel';
                db.collection("users").doc(doc.id).update({
                    send_friend_req : new_send_req
                })
            }).then(user=>{
                this.$router.go(this.$router.path);
            })
        }
    },
    created(){
        console.log("start")
        db.collection("users").doc(this.current_user).get().then(docu=>{
            this.f_r = docu.data().friend_req
            this.keys = Object.keys(this.f_r);
            this.friend_req = Object.entries(this.f_r);
            this.friend_list = docu.data().friend_list;
            console.log(this.friend_list)
            // console.log(this.friend_req)
            // console.log(this.keys)
        })
    },
    beforeCreate(){
        document.body.className = "body-friendpage";
        db.collection("users").get().then(querySnapshot=>{
                querySnapshot.forEach(doc=>{
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
                    hospital: doc.data().hospital,
                    send_req : doc.data().send_friend_req,
                    friend_list : doc.data().friend_list
                }
                    this.dump[data.id] = data
                })
                
            })
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

@-webkit-keyframes delete-fadeout {
      0% { opacity: 1; -webkit-transform: translateY(0); }   
    100% { opacity: 0; -webkit-transform: translateY(-100%); }
}
</style>
