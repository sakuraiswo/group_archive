class QuestionSheet < ApplicationRecord



  has_many :options, dependent: :destroy
  has_many :answers, dependent: :destroy
  belongs_to :user
  belongs_to :room

  # Nested attributes allow question sheets to manage options directly.
  accepts_nested_attributes_for :options, reject_if: :all_blank, allow_destroy: true


end
