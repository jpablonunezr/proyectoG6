class Material < ApplicationRecord
	has_many :user_materials, dependent: :destroy
	has_many :questions, dependent: :destroy
	belongs_to :level
	belongs_to :subject
	has_many :users, through: :user_materials
	accepts_nested_attributes_for :questions
	after_create :question_default

	def question_default
		q = questions.build(content: "Pregunta...")
		q.save
		q.alternatives.build(content: "Alternativa...").save
	end
end
