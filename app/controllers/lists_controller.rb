class ListsController < ApplicationController
  def index
    # make sure user is the owner of the activity/list
    @activity = current_activity
    @lists = @activity.lists
  end

  def new
    # make sure user is the owner of the activity/list
    @list = List.new
    @user = current_user
  end

  def create
    @list = List.create(list_params)

    redirect_to activity_list_path(@list.activity_id, @list)
  end

  def show
    # make sure user is the owner of the activity/list
    @list = current_list
  end

  def update
    @list = current_list
    if !params[:complete].nil?
      item_ids = params[:complete][:item_ids]
      item_ids.each do |id|
        @item = Item.find(id)
        @item.update!(complete: true)
      end

      redirect_to list_path(@list)
    else
      @item = Item.new(:name => params[:items][:name])
      @item.user_id = current_user.id
      @item.list_id = @list.id
      @item.save!

      redirect_to list_path(@list)
    end
  end

  def destroy
    @list = current_list
    @list.delete

    redirect_to activity_path(@list.activity)
  end

  private

  def list_params
    params.require(:list).permit(:name, :activity_id, :user_id,
                          items: [:name, :complete])
  end
end
