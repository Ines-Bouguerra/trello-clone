<template>
  <h1>Sign out</h1>
</template>

<script>
export default {
  asyncData() {
    $nuxt.$fire.auth.signOut()
  }
}
</script>
