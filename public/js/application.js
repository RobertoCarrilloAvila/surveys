$(document).ready(function() {
	
  $("#add_option").hide();

  var countQuestion = 1;//contador para los div de las preguntas
  var lastQuestionDiv = null;

  $("#create_question").click(function() {
    //console.log("boton")
    var question = $("#name_question").val();
    if(question!="" && question!=null){
      console.log(question);
      $("#questions").append(questionDiv(question, countQuestion));
      countQuestion++;
      $("#name_question").val("");
      $("#add_question").hide();
      $("#add_option").show();
    }//if
  });


  $("#create_option").click(function() {
    var option = $("#name_question").val();
    if(option!="" && option!=null){
      $(lastQuestionDiv).append("");
    }//if
  });


  function questionDiv(title, number) {
    lastQuestionDiv = "q"+number;
    return "<div id=\"q"+number+"\"><h1>"+title+"</h1></div>";
  }


});
