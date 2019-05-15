class User < ApplicationRecord
  has_many :pins
  has_many :lists, through: :pins
end
