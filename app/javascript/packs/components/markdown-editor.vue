<template>
  <div v-if="day">
    <h1>
      {{day.date}}
    </h1>
    <div v-if="day.text && !showEditor" @click="toggleEditor()">
      <vue-markdown>{{day.text}}</vue-markdown>
    </div>
    <div v-else>
      <div class="input-group">
        <textarea @change="updateDay(day); toggleEditor()" v-model="day.text" class="form-control mb-2"></textarea>
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
    name: 'markdownEditor',
    props: {
      day: Object
    },
    data() {
      return {
        showEditor: false,
      }
    },
    methods: {
      toggleEditor() {
        this.showEditor = !this.showEditor;
      },
      updateDay() {
        axios.patch(`/api/days/${this.day.id}`, {
          text: this.day.text,
          date: this.day.date
        })
        .then(response => (
          console.log(response)
        ))
      }
    },
    components: {
      VueMarkdown
    }
  }
</script>
