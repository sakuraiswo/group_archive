class Room < ApplicationRecord

  validates :room_name, presence: true
  validate :user_ids_must_be_unique

  has_many :room_users
  has_many :users, through: :room_users
  # has_many :chats
  # has_many :question_sheets
  # has_many :memos
  # has_many :archives




  private

  def user_ids_must_be_unique
    if user_ids.uniq.size != user_ids.size
      errors.add(:user_ids, "can't have duplicate members")
    end
  end


end
