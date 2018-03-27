<div id="left">

  <h1>Search</h1>
  <!-- Searches for a member_id by GET reuesting from the server -->
  <form method="GET" action="<?= BASE_URL ?>/member/searching/">
    <label>First Name: <input type="text" name="firstname" value=""></input></label><br/>
    <label>Last Name: <input type="text" name="lastname" value=""></input></label>
    <input type="submit" name="submit" value="Search"></input>
  </form>
</div>
