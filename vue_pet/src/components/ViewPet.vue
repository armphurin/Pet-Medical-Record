<template>
  <div id="view-pet">
    <ul class="collection with-header">
      <li class="collection-header"><h4>{{pet_name}}</h4></li>
      <li class="collection-item">Pet ID#: {{pet_id}}</li>
      <li class="collection-item">Department: {{dept}}</li>
      <li class="collection-item">Position: {{position}}</li>
    </ul>
    <router-link to="/" class="btn grey">Back</router-link>
    <button @click="deletePet" class="btn red">Delete</button>

    <div class="fixed-action-btn">
      <router-link v-bind:to="{ pet_name: 'edit-pet', params: { pet_id: pet_id }}" class="btn-floating btn-large red">
        <i class="fa fa-pencil"></i>
      </router-link>
    </div>
  </div>
</template>

<script>
import db from './firebaseInit';
export default {
  name: 'view-pet',
  data() {
    return {
      pet_id: null,
      pet_name: null,
      dept: null,
      position: null
    };
  },
  beforeRouteEnter(to, from, next) {
    db
      .collection('pets')
      .where('pet_id', '==', to.params.pet_id)
      .get()
      .then(querySnapshot => {
        querySnapshot.forEach(doc => {
          next(vm => {
            vm.pet_id = doc.data().pet_id;
            vm.pet_name = doc.data().pet_name;
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
        .collection('pets')
        .where('pet_id', '==', this.$route.params.pet_id)
        .get()
        .then(querySnapshot => {
          querySnapshot.forEach(doc => {
            this.pet_id = doc.data().pet_id;
            this.pet_name = doc.data().pet_name;
            this.dept = doc.data().dept;
            this.position = doc.data().position;
          });
        });
    },
    deletePet() {
      if (confirm('Are you sure?')) {
        db
          .collection('pets')
          .where('pet_id', '==', this.$route.params.pet_id)
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
