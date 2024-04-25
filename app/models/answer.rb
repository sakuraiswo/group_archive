class Answer < ApplicationRecord
 
  validates :answer_text, presence: true, unless: -> { option_id.present? }
  validates :option_id, presence: true, unless: -> { answer_text.present? }


  belongs_to :user
  belongs_to :question_sheet
  belongs_to :option, optional: true


end
