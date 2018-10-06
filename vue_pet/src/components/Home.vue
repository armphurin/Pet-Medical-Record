<template>
  <div id="home">
    <ul class="collection with-header">
      <li class="collection-header"><h4>Pet Medic</h4></li>
      <li v-for="pet in pets" v-bind:key="pet.id" class="collection-item">
        <div class="chip">{{pet.dept}}</div>
        {{pet.pet_id}}: {{pet.name}} 
         <router-link class="secondary-content" v-bind:to="{ pet_name: 'view-pet', params: { pet_id: pet.pet_id }}"><i class="fa fa-eye"></i></router-link>
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
  name: 'home',
  data() {
    return {
      pets: [],
      loading: true
    };
  },
  created() {
    db
      .collection('pets')
      .orderBy('dept')
      .get()
      .then(querySnapshot => {
        this.loading = false;
        querySnapshot.forEach(doc => {
          const data = {
            id: doc.id,
            pet_id: doc.data().pet_id,
            pet_name: doc.data().pet_name,
            dept: doc.data().dept,
            position: doc.data().position
          };
          this.pets.push(data);
        });
      });
  }
};
</script>