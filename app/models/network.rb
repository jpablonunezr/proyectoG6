class Network < ApplicationRecord
	has_many :user_networks, dependent: :destroys
	has_many :users, through: :user_networks
end
