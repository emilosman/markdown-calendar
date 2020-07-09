<template>
  <div v-if="day">
    <vue-markdown>{{day.text}}</vue-markdown>

    <div v-if="day.text && !showEditor" @click="toggleEditor()">
      <vue-markdown>{{day.text}}</vue-markdown>
    </div>
    <div v-else>
      <div class="input-group">
        <textarea @change="updateDay(day); toggleEditor()" v-model="day.text" class="form-control mb-2" style="min-height: 250px;"></textarea>
      </div>
      <div v-if="day.text" class="input-group" style="width: 169px;">
        <button @click="updateDay(day); toggleEditor()" class="btn btn-success form-control mb-4">Save</button>
      </div>
    </div>
  </div>
</template>

<script>
  import VueMarkdown from 'vue-markdown'
  import axios from 'axios'

  export default {
    data() {
      return {
        day: null,
        showEditor: true,
      }
    },
    mounted() {
      axios.get(`/api${window.location.pathname}`).then((response) => {
        this.day = response.data
        console.log(this.day)
      })
    },
    methods: {
      toggleEditor() {
        this.showEditor = !this.showEditor;
      },
      updateDay() {
        console.log('2')
      }
    },
    components: {
      VueMarkdown
    }
  }
</script>
