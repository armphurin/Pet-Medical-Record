import Vue from 'vue'
import App from './App.vue'
import router from './router'
import store from './store'
import firebase from 'firebase'

Vue.config.productionTip = false

var config = {
  apiKey: 'AIzaSyDQLpRy-xhEf65Ww2VSA3oRgxwVS13YG7E',
  authDomain: 'pet-medical-record-22d9a.firebaseapp.com',
  databaseURL: 'https://pet-medical-record-22d9a.firebaseio.com',
  projectId: 'pet-medical-record-22d9a',
  storageBucket: 'pet-medical-record-22d9a.appspot.com',
  messagingSenderId: '89596850596'
}

firebase.initializeApp(config)

new Vue({
  router,
  store,
  render: h => h(App)
}).$mount('#app')
