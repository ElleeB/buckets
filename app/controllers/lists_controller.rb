class ListsController < ApplicationController
  def new
    @list = List.new
  end

  def create
    @list = List.new(list_params)
    @list.user_id = current_user.id
    @list.bucket_item_id = current_bucket_item.id
    @list.save!

    render :show
  end

  def show
    # show only if the current user == to_do_list user
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def list_params
    params.require(:to_do_list).permit(:title, :user_id, :bucket_item_id)
  end
end
