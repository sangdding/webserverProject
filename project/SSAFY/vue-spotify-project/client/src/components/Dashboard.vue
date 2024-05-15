<script setup>
import { ref, onMounted, onBeforeUnmount,watch } from 'vue'
import SpotifyWebApi from "spotify-web-api-node"
import { useTokenStore } from '@/stores/spotifyToken';
import { storeToRefs } from 'pinia';
import TrackSearchResult from '@/components/TrackSearchResult.vue'

const store=useTokenStore()
const { accessToken }=storeToRefs(store)

const { VITE_CLIENT_ID } = import.meta.env;
const props=defineProps({
  code:String,
})
const spotifyApi=new SpotifyWebApi({
  clientId: VITE_CLIENT_ID,
})

const search = ref('')
const searchResults = ref([])
const playingTrack = ref(null)
const lyrics = ref('')

const chooseTrack = (track) => {
  playingTrack.value = track
  search.value = ''
  lyrics.value = ''
}

onMounted(() => {
  store.login(props.code)
  if (accessToken.value) {
    spotifyApi.setAccessToken(accessToken.value)
  }
})

watch(accessToken, (newAccessToken) => {
  if (newAccessToken) {
    spotifyApi.setAccessToken(newAccessToken)
  }
})

watch([search, accessToken], ([newSearch, newAccessToken]) => {
  // console.log(newSearch, newAccessToken)
  if (!newSearch) {
    searchResults.value = []
    return
  }
  if (!newAccessToken) return
  let cancel = false
  spotifyApi.searchTracks(newSearch).then(res => {
    // console.log(res.body.tracks.items)
    if (cancel) return
    searchResults.value =
      res.body.tracks.items.map(track => {
        const smallestAlbumImage = track.album.images.reduce(
          (smallest, image) => {
            if (image.height < smallest.height) return image
            return smallest
          },
          track.album.images[0]
        )

        return {
          artist: track.artists[0].name,
          title: track.name,
          uri: track.uri,
          albumUrl: smallestAlbumImage.url,
        }
      })
  })

  return () => (cancel = true)
})
</script>

<template>
  <div class="d-flex flex-column py-2" style="height: 100vh;">
    <input
      type="search"
      placeholder="Search Songs/Artists"
      v-model="search"
    />
    <div class="flex-grow-1 my-2" style="overflow-y: auto;">
      <template v-if="searchResults.length > 0">
        <TrackSearchResult
          v-for="track in searchResults"
          :key="track.uri"
          :track="track"
          @chooseTrack="chooseTrack"
        />
      </template>
      <div v-else class="text-center" style="white-space: pre;">{{ lyrics }}</div>
    </div>
    <Player v-if="playingTrack" :accessToken="accessToken" :trackUri="playingTrack.uri" /> 
  </div>
</template>

<style lang="scss" scoped>

</style>