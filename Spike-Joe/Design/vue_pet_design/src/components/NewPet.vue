<template>
  <div id="new-pet">
    <h3>New Pet</h3>
    <div class="row">
    <form @submit.prevent="savePet" class="col s12">
      <div class="row">
        <div class="input-field col s12">
          <input type="text" v-model="pet_id" required>
          <label>Pet ID#</label>
        </div>
      </div>
      <div class="row">
        <div class="input-field col s12">
          <input type="text" v-model="pet_name" required>
          <label>Pet Name</label>
        </div>
      </div>
      <div class="row">
        <div class="input-field col s12">
          <input type="text" v-model="dept" required>
          <label>Department</label>
        </div>
      </div>
      <div class="row">
        <div class="input-field col s12">
          <input type="text" v-model="position" required>
          <label>Position</label>
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
      name: 'new-pet',
      data () {
        return {
          pet_id: null,
          pet_name: null,
          dept: null,
          position: null
        }
      },
      methods: {
        savePet () {
          db.collection('pets').doc(this.pet_id).set({
            pet_id: this.pet_id,
            pet_name: this.pet_name,
            dept: this.dept,
            position: this.position
          })
          .then(docRef => {
            console.log('Client added: ', docRef.pet_id)
            this.$router.push('/')
          })
          .catch(error => {
            console.error('Error adding pet: ', error)
          })
        }
      }
    }
</script>
