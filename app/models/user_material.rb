class UserMaterial < ApplicationRecord
  belongs_to :material
  belongs_to :user
  has_many :comments, dependent: :destroy

  enum role: [:guest, :user, :collaborator, :owner]
end
