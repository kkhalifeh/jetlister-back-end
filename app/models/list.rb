class List < ApplicationRecord
  belongs_to :location
  belongs_to :author, class_name: 'User', :foreign_key => "author_id"
  has_many :list_places
  has_many :places, through: :list_places
  has_many :pins
  has_many :users, through: :pins
end
