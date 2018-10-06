import Vue from 'vue'
import Router from 'vue-router'
import Page1 from '@/components/page1'
import Page2 from '@/components/page2'

Vue.use(Router)

export default new Router({
    routes: [
        {
            path: "/",
            redirect: {
                name: "Page1"
            }
        },
        {
            path: '/page1',
            name: 'Page1',
            component: Page1
        },
        {
            path: '/page2',
            name: 'Page2',
            component: Page2
        }
    ]
})