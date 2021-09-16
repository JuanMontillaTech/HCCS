<template>
  <div>
sssssssssssssssssssssssssssssssssssssssss<a @click="this.$auth.login()" class="link">sign in</a> and see what happens?

   <base-button type="primary" v-on:click="$auth.loginWith('auth0')"
                      >Enviar</base-button
                    >
                        <div class="content">
      <h1>Hello, {{ $auth.loggedIn ? $auth.user.username : 'friend' }}!</h1>
      <p>
        This is a super simple example of how to use <a href="https://nuxtjs.org" target="_blank">Nuxt.js</a> and <a href="https://auth0.com" target="_blank">Auth0</a> together.
      </p>
      <p v-if="$auth.loggedIn">
        Now that you're authenticated, maybe you should try going to our <nuxt-link to="/secret" class="link">super secret page</nuxt-link>!
      </p>
      <p v-else>
        You're not authenticated yet. Maybe you want to <a @click="this.$auth.login()" class="link">sign in</a> and see what happens?
      </p>
    </div>
  </div>
</template>
<script>

  export default {
    layout: 'DashboardLayout',
    name: 'home-page',
    components: {

    }
  };
</script>
