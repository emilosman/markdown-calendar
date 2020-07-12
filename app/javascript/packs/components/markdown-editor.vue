<template>
  <div v-if="day">
    <h1>
      {{day.date}}
    </h1>
    <div v-if="day.text && !showEditor" @click="toggleEditor()">
      <img :src="day.image_url"/>
      <vue-markdown>{{day.text}}</vue-markdown>
    </div>
    <div v-else>
      <signature-pad class="mb-2" :day="day" v-if="this.day.image_url"/>
      <div class="input-group">
        <textarea ref="textareaInput" @change="updateDay(day); toggleEditor()" v-model="day.text" class="form-control mb-2"></textarea>
      </div>
      <div class="input-group mb-4" style="width: 169px;">
        <button @click="updateDay(day); toggleEditor()" class="btn btn-success form-control mr-2">Save</button>
        <button class="btn btn-light" v-if="!this.day.image_url" @click="openCanvas()">✏️</button>
      </div>
    </div>
  </div>
</template>

<script>
  import VueMarkdown from 'vue-markdown'
  import axios from 'axios'

  import signaturePad from './signature-pad';

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

        if (this.showEditor) {
          setTimeout(() => {
            this.$refs.textareaInput.focus()
          }, 250)
        }
      },
      updateDay() {
        axios.patch(`/api/days/${this.day.id}`, {
          text: this.day.text,
          date: this.day.date
        })
        .then(response => (
          console.log(response)
        ))
      },
      openCanvas() {
        this.day.image_url = " "
      }
    },
    components: {
      VueMarkdown,
      signaturePad
    }
  }
</script>
