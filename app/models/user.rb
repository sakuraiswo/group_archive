class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i

         # 新規作成時のみパスワードのバリデーションを実行
         validates_format_of :password, with: PASSWORD_REGEX, on: :create,
                                         message: 'must include both letters and numbers and be in half-width characters.'
         
         # パスワードが更新された場合のみ、更新時にパスワードのバリデーションを実行
         validates_format_of :password, with: PASSWORD_REGEX, on: :update, if: :encrypted_password_changed?,
                                         message: 'must include both letters and numbers and be in half-width characters.'

  validates :nickname, presence: true

  has_many :room_users
  has_many :rooms, through: :room_users
  # has_many :chats
  # has_many :question_sheets_users
  # has_many :question_sheets, through: :question_sheets_users
  # has_many :memos
  # has_many :archives
end
