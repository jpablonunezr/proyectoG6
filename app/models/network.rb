class Network < ApplicationRecord
	has_many :user_networks
	has_many :users, through: :user_networks
end
