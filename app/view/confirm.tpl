<div>

  <h1 class="login">Delete Confirmation</h1>

  <form method="POST" action="<?= BASE_URL ?>/member/delete/deleted" class="login">
    <h2>Are you sure you want to delete <b><?= $member->firstname?> <?= $member->lastname?></b> from your family?</h2><br><br>
    <label><input class="yesno2" type="submit" name="yes" value="Yes"></input></label>
    <label><input class="yesno" type="submit" name="no" value="No"></input></label><br>
    <label><input type="number" name="member_id" value="<?= $member->member_id ?>" style="display:none;"></input></label>
    <!-- <label><button id="cancel" type="button">No</button></label> -->
  </form>

</div>
