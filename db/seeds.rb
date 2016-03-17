user1 = User.create(name: "Roberto", email: "roberto@codea.mx", password: "1234")
user2 = User.create(name: "Miguel", email: "miguel@codea.mx", password: "4321")

user1.surveys << Survey.create(title: "test")

encuesta = user1.surveys.first

