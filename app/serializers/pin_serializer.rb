class PinSerializer < ActiveModel::Serializer
  attributes :id, :list, :user
  belongs_to :user
  belongs_to :list
end
