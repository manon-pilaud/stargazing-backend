class UserLocationSerializer < ActiveModel::Serializer
  belongs_to :user
  belongs_to :location
end
