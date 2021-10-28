class UserSerializer < ActiveModel::Serializer
  attributes :id, :email, :password, :first_name, :zipcode, :latitude, :longitude, :profile_picture, :age, :about_me

  has_many :favoriteformats
end
