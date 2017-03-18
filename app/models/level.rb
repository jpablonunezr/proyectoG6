class Level < ApplicationRecord
	has_many :user_levels, dependent: :destroy
	has_many :materials
end
