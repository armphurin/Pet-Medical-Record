<template>
  <div id="new-pet">
    <h3>Edit Pet</h3>
    <div class="row">
    <form @submit.prevent="updatePet" class="col s12">
      <div class="row">
        <div class="input-field col s12">
          <input type="text" v-model="pet_id" required>
        </div>
      </div>
      <div class="row">
        <div class="input-field col s12">
          <input type="text" v-model="pet_name" required>
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
      <router-link to="/" class="btn grey">Cancel</router-link>
    </form>
  </div>
  </div>
</template>

<script>
  import db from './firebaseInit'
  export default {
    name: 'edit-pet',
    data () {
      return {
        pet_id: null,
        pet_name: null,
        dept: null,
        position: null
      }
    },
    beforeRouteEnter (to, from, next) {
      db.collection('pets').where('pet_id', '==', to.params.pet_id).get().then((querySnapshot) => {
        querySnapshot.forEach((doc) => {
          next(vm => {
            vm.pet_id = doc.data().pet_id
            vm.pet_name = doc.data().pet_name
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
        db.collection('pets').where('pet_id', '==', this.$route.params.pet_id).get().then((querySnapshot) => {
          querySnapshot.forEach((doc) => {
            this.pet_id = doc.data().pet_id
            this.pet_name = doc.data().pet_name
            this.dept = doc.data().dept
            this.position = doc.data().position
          })
        })
      },
      updatePet () {
        db.collection('pets').where('pet_id', '==', this.$route.params.pet_id).get().then((querySnapshot) => {
          querySnapshot.forEach((doc) => {
            doc.ref.update({
              pet_id: this.pet_id,
              pet_name: this.pet_name,
              dept: this.dept,
              position: this.position
            })
            .then(() => {
              this.$router.push({ pet_name: 'view-pet', params: { pet_id: this.pet_id }})
            });
          })
        })
      }
    }
  }
</script>