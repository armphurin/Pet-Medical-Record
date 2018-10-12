<template>
  <div id="new-profile">
    <h3>Edit Profile</h3>
    <div class="row">
    <form @submit.prevent="updateProfile" class="col s12">
      <div class="row">
        <div class="input-field col s12">
          <input type="text" v-model="profile_id" required>
        </div>
      </div>
      <div class="row">
        <div class="input-field col s12">
          <input type="text" v-model="profile_name" required>
        </div>
      </div>
      <div class="row">
        <div class="input-field col s12">
          <input type="text" v-model="dept" required>
        </div>
      </div>
      <div class="row">
        <div class="input-field col s12">
          <input type="text" v-model="position" required>
        </div>
      </div>
      <button type="submit" class="btn">Submit</button>
      <router-link to="/home_profile" class="btn grey">Cancel</router-link>
    </form>
  </div>
  </div>
</template>

<script>
  import db from './firebaseInit'
  export default {
    name: 'edit-profile',
    data () {
      return {
        profile_id: null,
        profile_name: null,
        dept: null,
        position: null
      }
    },
    beforeRouteEnter (to, from, next) {
      db.collection('profiles').where('profile_id', '==', to.params.profile_id).get().then((querySnapshot) => {
        querySnapshot.forEach((doc) => {
          next(vm => {
            vm.profile_id = doc.data().profile_id
            vm.profile_name = doc.data().profile_name
            vm.dept = doc.data().dept
            vm.position = doc.data().position
          })
        })
      })
    },
    watch: {
      '$route': 'fetchData'
    },
    methods: {
      fetchData () {
        db.collection('profiles').where('profile_id', '==', this.$route.params.profile_id).get().then((querySnapshot) => {
          querySnapshot.forEach((doc) => {
            this.profile_id = doc.data().profile_id
            this.profile_name = doc.data().profile_name
            this.dept = doc.data().dept
            this.position = doc.data().position
          })
        })
      },
      updateProfile () {
        db.collection('profiles').where('profile_id', '==', this.$route.params.profile_id).get().then((querySnapshot) => {
          querySnapshot.forEach((doc) => {
            doc.ref.update({
              profile_id: this.profile_id,
              profile_name: this.profile_name,
              dept: this.dept,
              position: this.position
            })
            .then(() => {
              this.$router.push({ profile_name: 'view-profile', params: { profile_id: this.profile_id }})
            });
          })
        })
      }
    }
  }
</script>