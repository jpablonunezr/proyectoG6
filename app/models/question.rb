class Question < ApplicationRecord
  belongs_to :material
  has_many :alternatives, dependent: :destroy
  accepts_nested_attributes_for :alternatives
end
