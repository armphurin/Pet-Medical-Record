import Vue from 'vue'
import App from 'Components/App.vue'

new Vue({
    el: '#app',
    render(createElement){
        return createElement(App)
    }
})