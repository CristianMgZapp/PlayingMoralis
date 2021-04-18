<style scoped>
.addmargin {
  margin-top: 10px;
  margin-bottom: 10px;
}

.vue-logo-back {
  background-color: black;
}
</style>

<template>
  <div class="home">
    <div class="vue-logo-back">
      <img src="../assets/logo.png" width="100px" height="100px" />
    </div>
    <div class="col-md-6 centeralign">
      <p>This Page Displays a list of customers</p>

      <div id="example-1">
        <button v-on:click="login">Login</button>
      </div>
    </div>
  </div>
</template>

<script>
// @ is an alias to /src
import Moralis from "moralis";

export default {
  name: "customers",

  data() {
    return {
      user: "",
    };
  },

  mounted() {
    const plugin = document.createElement("script");
    plugin.setAttribute(
      "src",
      "//npmcdn.com/@elrondnetwork/erdjs@4.0.3/out-browser/erdjs.js"
    );
    plugin.async = true;
    document.head.appendChild(plugin);
  },
  components: {},
  methods: {
    // goToDetailsPage: function (id) {
    //   this.$router.push("/customerdetails/" + id);
    // },

    login: function () {
      Moralis.initialize("ES0DM6UEDPOA9JlLaNqTnienTgAQYkQjHmV9phZl");
      Moralis.serverURL = "4BMXxSp7t0tNFE7J7zWl8aZRxdpXOLgb77T573Kr";

      try {
        this.user = Moralis.User.current();
        if (!this.user) {
          this.user = Moralis.authenticate({ type: "erd" })
            .then((user) => this.handleAuthSuccess(user))
            .catch((error) => this.handleErrorLogin(error));
        }
        this.$log.debug("logged in user:", this.user);
      } catch (error) {
        this.$log.error("error when user is login", error);
      }
    }, 
 
    handleAuthSuccess: function (user) {
      this.user = user
      this.$log.debug("logged in user:", this.user);
    },
    handleErrorLogin: function (error) {
      this.$log.debug("error in login", error);
    },
  },
};
</script>
