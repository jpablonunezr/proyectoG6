class UserMaterial < ApplicationRecord
  belongs_to :material
  belongs_to :user
  has_many :comments
end
