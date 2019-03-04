class ActivitySerializer < ActiveModel::Serializer
  attributes :id, :title, :complete, :description, :due_date, :user_id, :category_id
  has_many :lists
end
