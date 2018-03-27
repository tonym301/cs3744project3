<div>

  <h1 id="login">Login</h1>
<!-- Logs the user in if the credentials are correct -->
<div class="login">
  <form method="POST" action="<?= BASE_URL ?>/login/process/">
    <label>Username <input type="text" name="user" value=""></label><br>
    <label>Password <input type="password" name="pass" value=""></label>
    <input type="submit" name="submit" value="Login"></input>
  </form>
</div>
</div>
