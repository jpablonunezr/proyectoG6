class Level < ApplicationRecord
	has_many :user_levels
	has_many :materials
end
