class UserLocation < ApplicationRecord
  belongs_to :user
  belongs_to :location
  validates_uniqueness_of :location_id, :scope => [:location_id, :user_id]
end
