<!-- Forms to update basic information on the indivdual -->

  <h1 class="title_family" >Add New Family Member/Relations</h1>
  <form class="addfam" action="<?= BASE_URL ?>/member/add/member/" method="POST">
  <div class="leftadd">
      <fieldset>
        <legend><strong>Personal information:</strong></legend>
        <label>*First name: <input type="text" name="firstname" placeholder="first" required="required"></label>
        <label style="margin-left: 20px;">*Last name:  <input type="text" name="lastname" placeholder="last" required="required"></label>
      </fieldset>

     <fieldset>
      <legend><strong>Birth/Death</strong></legend>
      <label><input type="radio" name="status" value="Alive" >Alive</input><br></label>
      <label><input type="radio" name="status" value="Deceased" checked>Deceased </input><br></label>
      <label style="margin-left: 8px;">Birth Date: <input type="date" name="birthdate"></label><br>
      <label id="ifDead" style="margin-left: 8px;">Death Date: <input type="date" name="deathdate"></input></label>
     </fieldset>

     <fieldset>
      <legend><strong>Image</strong></legend>
      <label>File Name: <input type="text" name="image" placeholder="face.png"></input></label>
     </fieldset>

     <fieldset>
       <legend><strong>Parents</strong></legend>
       <label>Mother: <input type="text" name="mother_firstname" placeholder="first"></input><input type="text" name="mother_lastname" placeholder="last"></input><br></label>
       <label>Father: <input type="text" name="father_firstname" placeholder="first"></input><input type="text" name="father_lastname" placeholder="last"></input><br></label>
     </fieldset>
     <input type="submit" name="submit" value="Add New Family Member" style="margin-left: 20%; margin-top:10%; margin-bottom:10%;"></input><br>


  </div>

    <div class="rightadd">
        <input id="eventName" type="text" placeholder="Name" class="text"></input>
        <input id="eventRelationship" placeholder="Relationship" class="text"></input><br>
        <button id="submitRelButton" type="button">Add</button>
        <button id="removeLastButton" type="button">Remove Last</button>


      <div class="family_table" style="overflow-y:auto;">
        <table>
          <tr>
            <td>Name</td>
            <td>Relationship</td>
          </tr>
        </table>
        <table id="relationships">

        </table>
      </div>

    </div>
</form>



<!-- Forms to update relationship table -->
