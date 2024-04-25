class QuestionSheet < ApplicationRecord

  validates :question, presence: true

  has_many :options
  has_many :answers
  belongs_to :user
  belongs_to :room

end
