class ListsController < ApplicationController
  def index
    # make sure user is the owner of the activity/list
    # @lists = current_user.lists #=> requires join table users_lists
  end

  def new
    # make sure user is the owner of the activity/list
    @list = List.new
  end

  def create
    @list = List.new(list_params)
    @list.user_id = current_user.id
    @list.save!

    redirect_to activity_list_path(@list.activity_id, @list)
  end

  def show
    # make sure user is the owner of the activity/list
    @list = List.find(params[:id])
  end

  private

  def list_params
    params.require(:list).permit(:name, :activity_id, :user_id)
  end
end
