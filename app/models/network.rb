class Network < ApplicationRecord
	has_many :user_networks, dependent: :destroy
	has_many :users, through: :user_networks
end
