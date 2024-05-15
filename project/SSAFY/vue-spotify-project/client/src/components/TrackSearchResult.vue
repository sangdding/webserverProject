
<script setup>
import { defineProps } from 'vue'

const props = defineProps({
  track: Object,
  chooseTrack: Function,
})

const handlePlay = () => {
  props.chooseTrack(props.track)
}
</script>

<template>
  <div
    class="d-flex m-2 align-items-center"
    style="cursor: pointer;"
    @click="handlePlay"
  >
    <img :src="track.albumUrl" style="height: 64px; width: 64px;" />
    <div class="ml-3">
      <div>{{ track.title }}</div>
      <div class="text-muted">{{ track.artist }}</div>
    </div>
  </div>
</template>