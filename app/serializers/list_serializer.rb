class ListSerializer < ActiveModel::Serializer
  attributes :id, :name, :user_id, :activity_id

  belongs_to :activity, serialize: ActivitySerializer
  belongs_to :user, serialize: UserSerializer
  has_many :items
end
