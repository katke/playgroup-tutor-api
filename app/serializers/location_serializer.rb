class LocationSerializer < ActiveModel::Serializer
  attributes :id, :zipcode, :latitude, :longitude
end
