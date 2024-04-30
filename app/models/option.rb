class Option < ApplicationRecord
 
  has_many :answers, dependent: :destroy
  belongs_to :question_sheet

end
