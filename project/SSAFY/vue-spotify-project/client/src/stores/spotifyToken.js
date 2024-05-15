import { ref, reactive, onMounted, watch, onUnmounted } from 'vue'
import { useRouter } from 'vue-router'
import { defineStore } from 'pinia'
import piniaPersist from 'pinia-plugin-persist'

import axios from 'axios'

export const useTokenStore = defineStore('token', () => {
  const code = ref(null) // Assign the appropriate value to code
  const accessToken = ref('')
  const refreshToken = ref('')
  const expiresIn = ref(0)

  const login = (c) => {
    const router = useRouter()
    code.value = c
    axios.post('http://localhost:5174/login', { code: c })
      .then((res) => {
        accessToken.value = res.data.accessToken
        refreshToken.value = res.data.refreshToken
        expiresIn.value = res.data.expiresIn
        router.push('/')
      }).catch((error) => {
        router.push('/')
      })
  }

  const refresh = () => {
    const router = useRouter()
    if (!refreshToken.value || !expiresIn.value) return

    const interval = setInterval(async () => {
      try {
        const res = await axios.post('http://localhost:5174/refresh', { refreshToken })
        accessToken.value = res.data.accessToken
        expiresIn.value = res.data.expiresIn
      } catch (error) {
        router.push('/')
      }
    }, (expiresIn - 60) * 1000)

    // // Cleanup interval on component unmount
    // $once('unmounted', () => {
    //   clearInterval(interval)
    // })
  }
  return {
    accessToken,
    refreshToken,
    expiresIn,
    code,
    login,
    refresh,
  }
}, true)
