// // src/components/useAuth.js

// import { ref } from 'vue';
// import axios from 'axios';
// import { useRouter } from 'vue-router';

// export default function useAuth(code) {
//   const router = useRouter();
//   const accessToken = ref(null);
//   const refreshToken = ref(null);
//   const expiresIn = ref(null);

//   const login = async () => {
//     await axios.post('http://localhost:5174/login', { code })
//       .then((response) => {
//         accessToken.value = response.data.accessToken;
//         refreshToken.value = response.data.refreshToken;
//         expiresIn.value = response.data.expiresIn;
//         router.push('/');
//       })
//       .catch((error) => {
//         console.error(error);
//         router.push('/');
//       })
//   };

//   const refresh = async () => {
//     if (!refreshToken.value || !expiresIn.value) return;

//     setInterval(async () => {
//       try {
//         const response = await axios.post('http://localhost:5174/refresh', { refreshToken: refreshToken.value });
//         accessToken.value = response.data.accessToken;
//         expiresIn.value = response.data.expiresIn;
//       } catch (error) {
//         console.error(error);
//         router.push('/');
//       }
//     }, (expiresIn.value - 60) * 1000);
//   };

//   // code가 제공되면 login 함수를 호출
//   if (code) {
//     login();
//   }

//   return {
//     accessToken,
//     refreshToken,
//     expiresIn,
//     login,
//     refresh,
//   };
//   return accessToken
// }
<template>
  <div>
    <!-- Your component template -->
  </div>
</template>

<script>
import { ref, reactive, onMounted, watch, onUnmounted } from 'vue'
import axios from 'axios'
import { useRouter } from 'vue-router'

export default {
  setup() {
    const router = useRouter()
    const code = ref(null) // Assign the appropriate value to code
    const accessToken = ref('')
    const refreshToken = ref('')
    const expiresIn = ref(0)

    onMounted(() => {
      if (!code.value) return

      axios
        .post('http://localhost:5174/login', {
          code: code.value,
        })
        .then(res => {
          accessToken.value = res.data.accessToken
          refreshToken.value = res.data.refreshToken
          expiresIn.value = res.data.expiresIn
          router.push('/')
        })
        .catch(() => {
          router.push('/')
        })
    })

    watch([refreshToken, expiresIn], ([newRefreshToken, newExpiresIn]) => {
      if (!newRefreshToken || !newExpiresIn) return

      const interval = setInterval(() => {
        axios
          .post('http://localhost:5174/refresh', {
            refreshToken: newRefreshToken,
          })
          .then(res => {
            accessToken.value = res.data.accessToken
            expiresIn.value = res.data.expiresIn
          })
          .catch(() => {
            router.push('/')
          })
      }, (newExpiresIn - 60) * 1000)

      // Cleanup interval on component unmount
      onUnmounted(() => {
        clearInterval(interval)
      })
    }, { immediate: true })

    return {
      accessToken,
      refreshToken,
      expiresIn,
      code
    }
  }
}
</script>

<style scoped>
/* Your component styles */
</style>
