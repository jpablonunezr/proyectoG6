class Subject < ApplicationRecord
	has_many :user_subjects, dependent: :destroy
	has_many :materials, dependent: :destroy
end
