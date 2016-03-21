$(document).ready(function() {
	
  $("#add_option").hide();

  var countQuestion = 1;//contador para los div de las preguntas
  var lastQuestionDiv = null;//indica en que div fue el ultimo que creamos
  var array_options = [];//array para almacenar las opciones de la pregunta
  var lastQuestionDescription = null;//almacena el titulo de la ultima pregunta

  $("#create_question").click(function() {
    //console.log("boton")
    var question = $("#name_question").val();
    if(question!="" && question!=null){
      console.log(question);
      lastQuestionDescription=question;
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
      array_options.push(option);
      var actualDiv = "#"+lastQuestionDiv+" ol";
      console.log(actualDiv);
      $(actualDiv).append("<li>"+option+"</li>");
      $("#name_option").val("");
    }//if
  });


  $("#question_ok").click(function() {

    //enviar peticion ajax para agregar opciones a la pregunta
    var variables = "title="+lastQuestionDescription+"&n_options="+array_options.length;
    for(var i=0;i<array_options.length;i++){
      variables+="&opc"+i+"="+array_options[i];
    }
    console.log(variables);
    $.post('/survey/new/question', variables);

    array_options = []; //limpiamos el contenido de el array
    $("#add_question").show();
    $("#add_option").hide();
  });





  function questionDiv(title, number) {
    lastQuestionDiv = "q"+number;
    return "<div id=\"q"+number+"\"><h1>"+title+"</h1><ol></ol></div>";
  }


  function postVars() {

  }


});
