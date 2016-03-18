

class User < ActiveRecord::Base

	has_many :authored_surveys, class_name: "Survey"
	
	has_many :participations
	has_many :taken_surveys, through: :participations, source: :survey
	has_many :answers, through: :participations

	#esto esta raro hay que checarlo
	has_many :options, through: :answers

	validates :email, uniqueness: true

    include BCrypt

	def self.authenticate(email, user_password)
		puts "*****************************************"
		user = User.find_by(email: email)
		puts "user: #{user.inspect}"
		puts "-------------------------------------------------------"
		puts "pass: #{user_password}"
		puts user.password==(user_password)
		if user && (user.password == user_password)
			return user
		else
			nil
		end
	end

	def password
	  @password ||= Password.new(password_digest)
	end

    def password=(user_password)
	  @password = Password.create(user_password)
	  self.password_digest = @password
	end


end
