class UserNetwork < ApplicationRecord
  belongs_to :user
  belongs_to :network
end
