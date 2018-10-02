<template>
    <div class="hello">
        <h1>{{ msg }}</h1>
        <router-link to="/page2">Navigate to Page2</router-link>
    </div>
</template>

<script>
import router from '../router'
    export default {
        name: 'Page1',
        /*
        data () {
            return {
                msg: 'Welcome to Your Vue.js App'
            }
        }
        */
       props: {
           msg: String
       },
       router
    }
</script>

<style scoped>
    h1, h2 {
        font-weight: normal;
    }

    ul {
        list-style-type: none;
        padding: 0;
    }

    li {
        display: inline-block;
        margin: 0 10px;
    }

    a {
        color: #42b983;
    }
</style>