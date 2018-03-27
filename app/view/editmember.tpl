<div class="leftmember">
    <h1 class="member_name"><?= $member->firstname ?> <?= $member->lastname ?></h1>
    <div class="member_photo">
      <?php if($member->image != null): ?>
       <img src="<?= BASE_URL ?>/public/img/<?= $member->image ?>" alt="Photo of <?= $member->firstname ?> <?= $member->lastname ?>" width="354" height="513">
       <?php else: ?>
       <img src="<?= BASE_URL ?>/public/img/SnowFamily.png" alt="Photo of <?= $member->firstname ?> <?= $member->lastname ?>" width="354" height="513">
      <?php endif; ?>
      <form action="<?= BASE_URL ?>/member/edit/photo/" method="POST">
        <!-- Edit personal photo -->
        <label>New File Name: <input type="text" name="image" placeholder="face.png" required="required"></input></label>
        <input type="submit" name="submit" value="Change photo"></input>
        <input type='hidden' name='member_id' value='<?= $member->member_id ?>' style='display:none;'></input>
      </form>
    </div>

      <!-- Personal information of family member -->
    <div class="personal_info">

      <h2><u>Personal Infromation:</u></h2>
      <p><b>Date of Birth:</b> <?= $member->birthdate ?> <br/>
      <?php if($member->deathdate != null): ?>
      <B>Date of Death: </b> <?= $member->deathdate ?> <br/>
      <?php endif; ?>
      <b>Parents:</b> <br>Father - <?= $member->father_firstname ?> <?= $member->father_lastname ?><br>Mother - <?= $member->mother_firstname ?> <?= $member->mother_lastname ?><br/></p>
      <form action="<?= BASE_URL ?>/member/edit/personal/" method="POST">
        <!-- Edit personal info -->
        <label>New Firstname: <input type="text" name="firstname" required="required"></input></label></br>
        <label>New Lastname: <input type="text" name="lastname"></input></label></br>
        <label>New Birthdate: <input type="date" name="birthdate"></input></label></br>
        <label>New Deathdate: <input type="date" name="deathdate"></input></label></br>
        <label>New Fathers firstname: <input type="text" name="father_firstname" ></input></label></br>
        <label>New Fathers lastname: <input type="text" name="father_lastname" ></input></label></br>
        <label>New Mothers firstname: <input type="text" name="mother_firstname" ></input></label></br>
        <label>New Mothers lastname: <input type="text" name="mother_lastname" ></input></label></br>
        <input type="submit" name="submit" value="Change personal information"></input></br>
        <input type='hidden' name='member_id' value='<?= $member->member_id ?>' style='display:none;'></input>
      </form>
    </div>
    <!-- Table of family members -->
    <div class="family_table" style="overflow-y:auto;">
      <table id="data">
        <tr>
          <th>Name</th>
          <th>Relationship</th>
        </tr>
        <?php foreach($relations as $relation): ?>
          <tr id="myTableRow">
            <td><?= $relation->name?></td>
            <td><?= $relation->relation?></td>
          </tr>
        <?php endforeach; ?>
      </table>
    </div>

</div>

<!-- Life event info division -->
<div class="rightmember">
  <div id="life_events">
    <h2 id="life">Life Events</h2>
    <form action="<?= BASE_URL ?>/member/edit/events/" method="POST">
      <!-- add events here -->
      <label>Year: <input type="text" name="year" required="required"></input></label></br>
      <label>Title: <input type="text" name="title" required="required"></input></label></br>
      <label>Description: <input type="text" name="description"></input></label></br>
      <input type="submit" name="submit" value="Add event"></input>
      <input type='hidden' name='member_id' value='<?= $member->member_id ?>' style='display:none;'></input>
    </form>
    <div id="data">
      <p class="wrap" id="event">
      <!-- Grabs the life events from the databse -->
        <?php foreach($events as $event): ?>
          <b><?= $event->title?> <?= $event->year?> </b><br/> <?= $event->description?><br/><br/>
        <?php endforeach; ?>
      </p>
  </div>
  </div>
</div>
