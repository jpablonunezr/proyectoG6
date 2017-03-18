class UserMaterial < ApplicationRecord
  belongs_to :material
  belongs_to :user
  has_many :comments

  enum role: [:guest, :user, :collaborator, :admin]
end
