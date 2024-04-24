class Chat < ApplicationRecord
  validates :message, presence: true, unless: :was_attached?

  belongs_to :user
  belongs_to :room
  has_one_attached :image

  def was_attached?
    image.attached?
  end
end
