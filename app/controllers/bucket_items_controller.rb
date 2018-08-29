class BucketItemsController < ApplicationController

  def index
    @bucket_items = current_user.bucket_items.all
  end

  def new
    @bucket_item = BucketItem.new
  end

  def create
    @bucket_item = BucketItem.new(bucket_item_params)
    @bucket_item.user = current_user
    if @bucket_item.save

      redirect_to bucket_item_path(@bucket_item)
    else
      render :new
    end
  end

  def edit
    # create an app helper method for this
    @bucket_item = BucketItem.find(params[:id])
  end

  def update
  end

  def show
    @bucket_item = BucketItem.find(params[:id])
  end

  private
  def bucket_item_params
    params.require(:bucket_item).permit(:title, :description, :due_date, :user)
  end
end
