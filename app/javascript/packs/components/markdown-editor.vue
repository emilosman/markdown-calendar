<template>
  <div v-if="day">
    <h1>
      <a :href="dayUrl">
        {{day.date}}
      </a>
    </h1>
    <div v-if="highlightedText && !showEditor" @click="toggleEditor()">
      <vue-markdown :key="highlightedText" ref="viewMarkdown">{{highlightedText}}</vue-markdown>
    </div>
    <div v-else>
      <div class="input-group">
        <textarea ref="textareaInput" @change="updateDay(day); toggleEditor()" v-model="day.text" class="form-control mb-2"></textarea>
      </div>
      <div class="input-group mb-4" style="width: 169px;">
        <button @click="updateDay(day); toggleEditor()" class="btn btn-success form-control mr-2">Save</button>
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
      day: Object,
      search: String
    },
    data() {
      return {
        showEditor: false,
      }
    },
    computed: {
      highlightedText() {
        if (this.day.text && this.search) {
          return this.day.text.replace(
            new RegExp( '(' + this.search + ')', 'gi'),
            `<mark>${this.search}</mark>`
          )
        } else {
          return this.day.text
        }
      },
      dayUrl() {
        let d = new Date(Date.parse(this.day.date));
        let dayUrl = `${ d.getMonth() + 1 }-${ d.getDate() }-${ d.getFullYear() }`
        return "days/" + dayUrl
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
    },
    components: {
      VueMarkdown,
    }
  }
</script>
