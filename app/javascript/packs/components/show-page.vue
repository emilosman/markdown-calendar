<template>
  <markdown-editor :day="day"></markdown-editor>
</template>

<script>
  import axios from 'axios'
  import markdownEditor from './markdown-editor'

  export default {
    data() {
      return {
        day: null,
      }
    },
    mounted() {
      axios.get(`/api${window.location.pathname}`).then((response) => {
        this.day = response.data
      })
    },
    components: {
      markdownEditor
    }
  }
</script>
