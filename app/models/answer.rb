class Answer < ApplicationRecord
 
  belongs_to :user
  belongs_to :question_sheet
  belongs_to :option

end
