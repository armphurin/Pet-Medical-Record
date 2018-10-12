<template>
  <div id="home">
    <ul class="collection with-header">
      <li class="collection-header"><h4>Pet Medic Profile</h4></li>
      <li v-for="profile in profiles" v-bind:key="profile.id" class="collection-item">
        <div class="chip">{{profile.profile_id}}</div>
        {{profile.profile_name}}: {{profile.dept}} 
         <router-link class="secondary-content" v-bind:to="{ name: 'view-profile', params: { profile_id: profile.profile_id }}">Show {{profile.profile_id}}<i class="fa fa-eye"></i></router-link>
      </li>
    </ul>
    <div class="fixed-action-btn">
      <router-link to="/new" class="btn-floating btn-large red">
        <i class="fa fa-plus"></i>
      </router-link>
    </div>
  </div>
</template>

<script>
import db from './firebaseInit';
export default {
  name: 'home-profile',
  data() {
    return {
      profiles: [],
      loading: true
    };
  },
  created() {
    db
      .collection('profiles')
      .orderBy('dept')
      .get()
      .then(querySnapshot => {
        this.loading = false;
        querySnapshot.forEach(doc => {
          const data = {
            id: doc.id,
            profile_id: doc.data().profile_id,
            profile_name: doc.data().profile_name,
            dept: doc.data().dept,
            position: doc.data().position
          };
          this.profiles.push(data);
        });
      });
  }
};
</script>