class Answer < ApplicationRecord
  belongs_to :user
  belongs_to :question_sheet
  belongs_to :option, optional: true

  validate :answer_text_or_option_id_present

  private

  def answer_text_or_option_id_present
    return unless answer_text.blank? && option_id.blank?

    errors.add(:base, 'Either answer_text or option_id must be present.')
  end
end
