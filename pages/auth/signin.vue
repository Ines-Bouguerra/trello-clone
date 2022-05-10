<template>
  <v-row align="center" justify="center">
    <v-col cols="12" sm="" md="6" align="center">
      <v-card class="elevation-4 text-left">
        <v-card-title class="fancy-title align-center justify-center"
          >My Trello</v-card-title
        ><v-card-text>
          <v-form>
            <v-text-field
              label="Login"
              name="login"
              prepend-icon="mdi-account"
              type="text"
              v-model="auth.email"
            ></v-text-field>

            <v-text-field
              label="Password"
              name="password"
              prepend-icon="mdi-lock"
              type="password"
              v-model="auth.password"
            ></v-text-field>
          </v-form>
        </v-card-text>
        <v-card-actions class="text-center">
          <v-btn class="login-button" @click="login" color="error" depressed 
            >Login</v-btn
          >
        </v-card-actions>
      </v-card>
      <v-snackbar :timeout="4000" v-model="snackbar" absolute bottom center>
        {{ snackbarText }}
      </v-snackbar>
    </v-col>
  </v-row>
</template>

<script>
export default {
  layout: "signin",
  data() {
    return {
      snackbar: false,
      snackbarText: "No error message",
      auth: {
        email: "",
        password: "",
      },
    };
  },
  methods: {
    login() {
      let that = this
      this.$fire.auth.signInWithEmailAndPassword(this.auth.email, this.auth.password)
      .catch(function (error){
        that.snackbarText = error.message
        that.snackbar = true
      }).then(() => {
        //we are signed in
        $nuxt.$router.push('/')
      })
    }
  }
}
</script>
