$(document).ready(function() {
	

  $("#create_question").click(function() {
    console.log("boton")
    var question = $("#name_question").val();
    console.log(question)
    $("#questions").append("
      <div>
      <h1>"+question+"</h1>
      
      </div>");
    var question = $("#name_question").val("");
  });


});
