class ActivitySerializer < ActiveModel::Serializer
  attributes :id, :title, :complete, :description, :due_date, :user_id, :category_name
  attribute :countdown

  has_one :category, serialize: CategorySerializer
  has_many :lists

  def category_name
    # references the instance of serializers activity
    self.object.category.name
  end

end
