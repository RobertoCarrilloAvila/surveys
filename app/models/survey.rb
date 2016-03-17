class Survey < ActiveRecord::Base

	belongs_to :author, class_name: "User"
	has_many :participations
	has_many :survey_takers, through: :participations, source: :user
	has_many :answers, through: :participations
	has_many :questions


end
