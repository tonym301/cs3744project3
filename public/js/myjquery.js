$(document).ready(function(){

  //On button press show information to update table
  $('#addRelButton').click(function(){
    $('#addRelForm').show();
    $('#eventName').focus();
    $('#addRelForm').find('.text').each(function(){
        $(this).val('');
    });
  });

  //On button press insert new information into table
  $("#submitRelButton").click(function() {
          var name = $("#eventName").val();
          var relationship = $("#eventRelationship").val();
          var example = "<tr><td>" + name +"</td><td>" +
              relationship + "</td></tr>";
          $("#relationships").append(example);
          var data = "<input type='hidden' name='name[]' value='"+name+"' style='display:none;'>" +
          "</input><input type='hidden' name='relationship[]' value='"+relationship+"' style='display:none;'></input>"
          $(".addfam").append(data);
  });

  // Removes the last relationship added
  $('#removeLastButton').on("click", function(){
    $('#relationships tr:last').remove();
  });

  // When Deceased radio button is pressed, show death date input
  $('input[type=radio][name=status]').change(function() {
        if (this.value == 'Deceased') {
            $('input[type=date][name=Deathdate]').show();
            $('#ifDead').show();
        }
        else if (this.value == 'Alive') {
            $('input[type=date][name=Deathdate]').hide();
            $('#ifDead').hide();
        }
    });



});
