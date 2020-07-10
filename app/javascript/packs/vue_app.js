/* eslint no-console: 0 */

import TurbolinksAdapter from 'vue-turbolinks'
import Vue from 'vue/dist/vue.esm'
import axios from 'axios'
import heatmapComponent from './components/heatmap-component'
import markdownEditor from './components/markdown-editor'
import showPage from './components/show-page'
import MQ from 'vue-match-media/src'

Vue.use(TurbolinksAdapter)
Vue.use(MQ)

document.addEventListener('turbolinks:load', () => {
  axios.defaults.headers.common['X-CSRF-Token'] = document.querySelector('meta[name="csrf-token"]').getAttribute('content');

  const app = new Vue({
    el: '#app',
    mq: {
      mini: 'only screen and (max-width: 300px)',
      phone: 'only screen and (max-width: 768px)',
      tablet: 'only screen and (min-width: 769px) and (max-width: 1024px)',
    },
    components: {
      heatmapComponent,
      markdownEditor,
      showPage
    }
  })
})
