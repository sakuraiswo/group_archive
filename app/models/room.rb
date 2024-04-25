class Room < ApplicationRecord
  validates :room_name, presence: true
  validate :user_ids_must_be_unique
  validate :must_have_exactly_three_users

  has_many :room_users
  has_many :users, through: :room_users, autosave: false
  has_many :chats
  has_many :question_sheets
  has_many :memos
  has_many :archives

  private

  def user_ids_must_be_unique
    return unless user_ids.uniq.size != user_ids.size

    errors.add(:users, "can't have duplicate members")
  end

  def must_have_exactly_three_users
    errors.add(:users, 'must be exactly two users (and you)') unless users.size == 3
  end
end
