class Question < ApplicationRecord
  belongs_to :material
  has_many :alternatives
end
