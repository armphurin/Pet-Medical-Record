<template>
    <div class="hello">
        <h1>{{ msg }}</h1>
        <a style="cursor: pointer; text-decoration: underline" v-on:click="navigate()">Navigate to Page1</a>
    </div>
</template>

<script>
    import router from '../router'

    export default {
        name: 'Page2',
        data () {
            return {
                msg: 'Hey Nic Raboy'
            }
        },
        methods: {
            navigate() {
                router.push({ name: "Page1" });
            }
        }
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