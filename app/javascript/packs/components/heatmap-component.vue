<template>
  <div v-if="days">
    <calendar-heatmap
      :end-date="endDate"
      :values="days"
      :tooltip="true"
      :vertical="$mq.phone"
      :max="20"
      tooltip-unit="points"
      @day-click="dayClick"
    ></calendar-heatmap>
  </div>
</template>

<script>
  import { CalendarHeatmap } from 'vue-calendar-heatmap'
  import axios from 'axios'

  export default {
    name: 'heatmapComponent',
    data() {
      return {
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
      }
    },
    components: {
      CalendarHeatmap
    }
  }
</script>
