class Archive < ApplicationRecord
  validates :display_order, presence: true
  validates :display_order, format: { with: /\A(?:100(?:\.0{1,4})?|0*(?:[1-9]|[1-9][0-9])?(?:\.[0-9]{1,4})?)\z/ }


  belongs_to :user
  belongs_to :room
  has_one_attached :image
end
