/* eslint no-console: 0 */

import TurbolinksAdapter from 'vue-turbolinks'
import Vue from 'vue/dist/vue.esm'
import axios from 'axios'
import heatmapComponent from './components/heatmap-component'

Vue.use(TurbolinksAdapter)

document.addEventListener('turbolinks:load', () => {
  axios.defaults.headers.common['X-CSRF-Token'] = document.querySelector('meta[name="csrf-token"]').getAttribute('content');

  const app = new Vue({
    el: '#app',
    components: {
      heatmapComponent
    }
  })
})