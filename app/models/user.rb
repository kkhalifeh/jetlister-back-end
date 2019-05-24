class User < ApplicationRecord
  authenticates_with_sorcery!

  validates :password,
            length: { minimum: 3 },
            if: -> { new_record? || changes[:crypted_password] }
  validates :password,
            confirmation: true,
            if: -> { new_record? || changes[:crypted_password] }
  validates :password_confirmation,
            presence: true,
            if: -> { new_record? || changes[:crypted_password] }

  validates :email, uniqueness: true
  validates :username, uniqueness: true

  has_many :pins
  has_many :lists, through: :pins
end
