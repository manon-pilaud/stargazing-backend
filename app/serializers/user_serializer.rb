class UserSerializer < ActiveModel::Serializer
  attributes :id,:name,:user_type
  has_many :locations, through: :user_locations
end
