<script setup>
import {onMounted,ref} from "vue"
import { useRoute } from 'vue-router'

import Login from "@/components/Login.vue"
import Dashboard from "@/components/Dashboard.vue"

const route = useRoute();
const code=ref("")

onMounted(() => {
  code.value = new URLSearchParams(window.location.search).get("code")
  // console.log(code.value)

})
</script>

<template>
  <Dashboard v-if="code" :code="code"/>
  <Login v-else/>
  <!-- <RouterView /> -->
</template>

<style scoped>

</style>
