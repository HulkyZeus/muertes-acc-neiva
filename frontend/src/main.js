import './assets/main.css'

import { createApp } from 'vue'
import { createPinia } from 'pinia'
import '/node_modules/flowbite-datepicker/dist/css/datepicker.css'
import 'primeicons/primeicons.css'
import 'flowbite-vue/index.css' 

import App from './App.vue'
import router from './router'

const app = createApp(App)

app.use(createPinia())
app.use(router)

app.mount('#app')
