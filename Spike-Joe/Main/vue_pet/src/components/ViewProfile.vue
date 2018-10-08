<template>
  <div id="view-profile">
    <ul class="collection with-header">
      <li class="collection-header"><h4>{{profile_name}}</h4></li>
      <li class="collection-item">Profile ID#: {{profile_id}}</li>
      <li class="collection-item">Department: {{dept}}</li>
      <li class="collection-item">Position: {{position}}</li>
    </ul>
    <router-link to="/home_profile" class="btn grey">Back</router-link>
    <button @click="deleteProfile" class="btn red">Delete</button>

    <div class="fixed-action-btn">
      <router-link v-bind:to="{ profile_name: 'edit-profile', params: { profile_id: profile_id }}" class="btn-floating btn-large red">
        <i class="fa fa-pencil"></i>
      </router-link>
    </div>
  </div>
</template>

<script>
import db from './firebaseInit';
export default {
  name: 'view-profile',
  data() {
    return {
      profile_id: null,
      profile_name: null,
      dept: null,
      position: null
    };
  },
  beforeRouteEnter(to, from, next) {
    db
      .collection('profiles')
      .where('profile_id', '==', to.params.profile_id)
      .get()
      .then(querySnapshot => {
        querySnapshot.forEach(doc => {
          next(vm => {
            vm.profile_id = doc.data().profile_id;
            vm.profile_name = doc.data().profile_name;
            vm.dept = doc.data().dept;
            vm.position = doc.data().position;
          });
        });
      });
  },
  watch: {
    $route: 'fetchData'
  },
  methods: {
    fetchData() {
      db
        .collection('profiles')
        .where('profile_id', '==', this.$route.params.profile_id)
        .get()
        .then(querySnapshot => {
          querySnapshot.forEach(doc => {
            this.profile_id = doc.data().profile_id;
            this.profile_name = doc.data().profile_name;
            this.dept = doc.data().dept;
            this.position = doc.data().position;
          });
        });
    },
    deleteProfile() {
      if (confirm('Are you sure?')) {
        db
          .collection('profiles')
          .where('profile_id', '==', this.$route.params.profile_id)
          .get()
          .then(querySnapshot => {
            querySnapshot.forEach(doc => {
              doc.ref.delete();
              this.$router.push('/');
            });
          });
      }
    }
  }
};
</script>
