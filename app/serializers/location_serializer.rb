class LocationSerializer < ActiveModel::Serializer
  attributes :id,:name,:description,:latitude,:longitude,:category,:rating,:image,:area,:country,:creator
  has_many :user_locations
  has_many :users, through: :user_locations
end
