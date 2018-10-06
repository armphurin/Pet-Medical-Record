<template>
    <div>
        <form id="login_form" method="POST" action="SigninServlet">
            <div class="account-setup register-form">
                <h1>Welcom {{msg}}</h1>
                <h2>Please insert your Username & Password</h2>
                <input name="username" type="text" placeholder="Username" required="required" />
                <input name="password" type="password" placeholder="Password" required="required" />
                <div id="submit_login" class="button firstNext">Login</div>
            </div>
        </form>
    </div>
</template>

<script>
export default {
  name: 'Login',
  props: {
    msg: String
  }
}
</script>
