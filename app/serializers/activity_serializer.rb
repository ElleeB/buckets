class ActivitySerializer < ActiveModel::Serializer
  attributes :id, :title, :complete, :description, :due_date, :user_id, :category_id
  attribute :countdown

  has_one :category, serialize: CategorySerializer
  has_many :lists
end
