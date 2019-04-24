class UserSerializer < ActiveModel::Serializer
  attributes :id,:username,:user_type
  has_many :locations, through: :user_locations
end
