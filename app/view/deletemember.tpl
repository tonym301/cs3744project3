<h1 class="title_family">Delete Family Member</h1>
<div class="family_table">
    <!-- Family Table-->
    <table id="data">
      <tr> <th>Name</th>  <th>ID Number</th> </tr>
      <?php foreach($members as $member): ?>
      <tr><td><a href="<?= BASE_URL ?>/member/view/<?= $member->member_id ?>"><?= $member->firstname?> <?= $member->lastname?></a></td>
        <td><label value="<?= $member->member_id ?>"><?= $member->member_id ?></label></td></tr>
      <?php endforeach; ?>
    </table>
</div>

<div class="deleteQ">
  <form class="delfam" action="<?= BASE_URL ?>/member/delete/confirm" method="POST">
    <fieldset>
      <legend><strong>Delete Family Member:</strong></legend>
      <label>ID number of who you want to delete: <input type="number" name="id" id="checkID" placeholder="0"></input></label><br>
      <input type="submit" name="submit" value="Delete Family Member"></input>
    </fieldset>
  </form>
</div>
