class Subject < ApplicationRecord
	has_many :user_subjects
	has_many :materials
end
