class Material < ApplicationRecord
	has_many :user_materials
	has_many :questions
	has_many :users, through: :user_materials
end
