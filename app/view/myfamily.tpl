<div>
  <h1 class="title_family">Stark Family List</h1>
    <!-- Family Table-->

  <div class="family_list" style="overflow-y:auto;"> <!-- Allows the table to scroll-->
    <table class="table">
      <tr id="myTableRow"> <th>Name</th>  <th>Birth date</th>  <th>Father</th>  <th>Mother</th>  </tr>
      <!-- Fills in table with family member information -->
      <?php foreach($members as $member): ?>
      <tr id="myTableRow"><td>
        <a href="<?= BASE_URL ?>/member/view/<?= $member->member_id ?>">
          <?= $member->firstname?> <?= $member->lastname?></a></td>
          <td><?= $member->birthdate?></td>
          <td><?= $member->father_firstname?> <?= $member->father_lastname?></td>
          <td><?= $member->mother_firstname?> <?= $member->mother_lastname?></td></tr>
          <?php endforeach; ?>
    </table>
  </div>

</div>
