<template>
  <div v-if="days">
    <calendar-heatmap
      :end-date="endDate"
      :values="days"
      :tooltip="true"
      :max="20"
      tooltip-unit="points"
      @day-click="dayClick"
      class="mb-4"
    ></calendar-heatmap>


    <div class="input-group mb-4">
      <input v-model="searchBar" v-on:keyup="searchItems()" type="text" class="form-control" placeholder="Search"/>
    </div>

    <div v-for="day in days" :key="day.date">
      <markdown-editor :day="day"></markdown-editor>
    </div>
  </div>
</template>

<script>
  import { CalendarHeatmap } from 'vue-calendar-heatmap'
  import markdownEditor from './markdown-editor'
  import axios from 'axios'
  import debounce from 'debounce'

  export default {
    name: 'heatmapComponent',
    data() {
      return {
        searchBar: null,
        days: null,
        endDate: Date.now(),
        vertical: false
      }
    },
    mounted() {
      axios.get(`/api/days`).then((response) => {
        this.days = response.data
      })
    },
    methods: {
      dayClick: function(date) {
        let d = new Date(Date.parse(date.date));
        let dayUrl = `${ d.getMonth() + 1 }-${ d.getDate() }-${ d.getFullYear() }`
        window.location.href = `/days/${dayUrl}`
      },
      searchItems: function(){
        let search =  this.searchBar || "_"
        axios.get(`/api/days?search=${search}`).then((response) => {
          this.days = response.data
        })
      }
    },
    components: {
      CalendarHeatmap,
      markdownEditor
    }
  }
</script>
