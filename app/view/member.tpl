<div class="leftmember">
    <h1 class="member_name"><?= $member->firstname ?> <?= $member->lastname ?></h1>
    <div class="member_photo">
      <!-- sets photo to default if none were found -->
      <?php if($member->image != null): ?>
       <img src="<?= BASE_URL ?>/public/img/<?= $member->image ?>" alt="Photo of <?= $member->firstname ?> <?= $member->lastname ?>" width="354" height="513"></img>
       <?php else: ?>
       <img src="<?= BASE_URL ?>/public/img/SnowFamily.png" alt="Photo of <?= $member->firstname ?> <?= $member->lastname ?>" width="354" height="513"></img>
      <?php endif; ?>
    </div>

      <!-- Personal information of family member -->
    <div class="personal_info">
      <h2><u>Personal Infromation:</u></h2>
      <p><b>Date of Birth:</b> <?= $member->birthdate ?> <br/>
      <?php if($member->deathdate != null): ?>
      <B>Date of Death: </b> <?= $member->deathdate ?> <br/>
      <?php endif; ?>
      <b>Parents:</b> <br/>Father - <?= $member->father_firstname ?> <?= $member->father_lastname ?><br>Mother - <?= $member->mother_firstname ?> <?= $member->mother_lastname ?><br/></p>
    </div>
    <!-- Table of family members -->
    <div class="family_table" style="overflow-y:auto;">
      <table id="data">
        <tr>
          <th>Name</th>
          <th>Relationship</th>
        </tr>
        <!-- Grabs the relationships from the databse -->
        <?php foreach($relations as $relation): ?>
          <tr id="myTableRow">
            <td><?= $relation->name?></td>
            <td><?= $relation->relation?></td>
            <?php endforeach; ?>
          </tr>
      </table>
    </div>
</div>

<!-- Life event info division -->
<div class="rightmember">
  <div id="life_events">
    <h2 id="life">Life Events</h2>
    <div id="data">
    <p class="wrap">
      <!-- Grabs the life events from the databse -->
      <?php foreach($events as $event): ?>
          <b><?= $event->title?> <?= $event->year?> </b><br/> <?= $event->description?><br/><br/>
      <?php endforeach; ?>
    </p>
  </div>
  </div>
</div>
