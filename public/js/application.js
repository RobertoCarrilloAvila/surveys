$(document).ready(function() {
	
  $("#add_option").hide();

  var countQuestion = 1;//contador para los div de las preguntas
  var lastQuestionDiv = null;//indica en que div fue el ultimo que creamos

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
    var option = $("#name_option").val();
    if(option!="" && option!=null){
      var actualDiv = "#"+lastQuestionDiv+" ol";
      console.log(actualDiv);
      $(actualDiv).append("<li>"+option+"</li>");
      $("#name_option").val("");
    }//if
  });


  $("#question_ok").click(function() {

    $("#add_question").show();
    $("#add_option").hide();
  });




  $("#formulario").submit(function( event ) {
    //event.preventDefault();
    //var variables = $( "#formulario" ).serialize();

    $.post('/', variables, function(resp) {
        //console.log("hola");
        $( "#result" ).html(resp);
        console.log(resp);
    });

  });




  function questionDiv(title, number) {
    lastQuestionDiv = "q"+number;
    return "<div id=\"q"+number+"\"><h1>"+title+"</h1><ol></ol></div>";
  }


});
