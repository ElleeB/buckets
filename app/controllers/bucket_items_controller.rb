class BucketItemsController < ApplicationController
  def new
    @bucket_item = BucketItem.new
  end

  # def create
  #   @bucket_item = BucketItem.create(bucket_item_params)
  #
  #   redirect_to bucket_item_path(@bucket_item)
  # end
  #
  # private
  # def bucket_item_params
  #   params.require(:bucket_item).permit(:title, :description, :due_date)
  # end
end
