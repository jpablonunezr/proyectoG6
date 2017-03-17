class Question < ApplicationRecord
  belongs_to :material, inverse_of: :questions
  has_many :alternatives, inverse_of: :question, dependent: :destroy
  accepts_nested_attributes_for :alternatives, allow_destroy: true
end
