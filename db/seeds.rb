user1 = User.create(name: "Roberto", email: "roberto@codea.mx", password: "1234")
user2 = User.create(name: "Miguel", email: "miguel@codea.mx", password: "4321")

encuesta = Survey.create(title: "test")

pregunta = Question.create(description: "q1")

opc1 = Option.create(description: "option1")
opc2 = Option.create(description: "option2")
opc3 = Option.create(description: "option3")

particip = Participation.create(user_id: user2.id, survey_id: encuesta.id)
ans = Answer.create(participation_id: particip.id, option_id: opc1.id)

pregunta.options << opc1 << opc2 << opc3

encuesta.questions << pregunta

user1.authored_surveys << encuesta

user2.taken_surveys << encuesta
