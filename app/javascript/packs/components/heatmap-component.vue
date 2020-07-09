<template>
    <calendar-heatmap
      :end-date="endDate"
      :values="[{ date: '1-1-2020', count: 6 }]"
      :tooltip="true"
      tooltip-unit="points"
      @day-click="dayClick"
    ></calendar-heatmap>
</template>

<script>
  import { CalendarHeatmap } from 'vue-calendar-heatmap'

  export default {
    name: 'heatmapComponent',
    data() {
      return {
        endDate: Date.now()
      }
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
