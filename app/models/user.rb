class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :user_subjects
  has_many :user_levels
  has_many :user_networks
  has_many :subjects, through: :user_subjects
  has_many :levels, through: :user_levels
	has_many :networks, through: :user_networks
end
