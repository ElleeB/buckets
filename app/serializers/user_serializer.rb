class UserSerializer < ActiveModel::Serializer
  attributes :id, :name, :username, :email, :image
  has_many :activities
  has_many :lists
end
