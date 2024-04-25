class Option < ApplicationRecord

  validates :title, presence: true

 
  has_many :answers
  belongs_to :question_sheet

end
