<script setup>

const AUTH_URL =
  "https://accounts.spotify.com/authorize?client_id=6d5da789617a425596235602ab5ba380&response_type=code&redirect_uri=http://localhost:5173&scope=streaming%20user-read-email%20user-read-private%20user-library-read%20user-library-modify%20user-read-playback-state%20user-modify-playback-state"


</script>

<template>
  <div>
    <a :href="AUTH_URL" >Login</a>
  </div>
</template>
<style scoped>

</style>