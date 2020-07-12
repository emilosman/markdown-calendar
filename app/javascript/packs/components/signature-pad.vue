<template>
  <div>
    <VueSignaturePad
      width="1024px"
      height="500px"
      ref="signaturePad"
      class="border"
      :options="{ onEnd }"
      :images="[this.day.image_url]"
    />
    <div>
      <button @click="undo">Undo</button>
    </div>
  </div>
</template>

<script>
  import axios from 'axios'
  export default {
    name: 'signaturePad',
    props: {
      day: Object
    },
    methods: {
      undo() {
        this.$refs.signaturePad.undoSignature();
      },
      save() {
        const { isEmpty, data } = this.$refs.signaturePad.saveSignature();

        axios.patch(`/api/days/${this.day.id}`, {
          image: data
        })
        .then(response => (
          console.log(response)
        ))
      },
      onEnd () {
        this.save()
      }
    },
  };
</script>
