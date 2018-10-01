class ListsController < ApplicationController
  def index
    if logged_in? && params[:activity_id]
      @activity = current_activity
      # @lists = @activity.lists
    else
      redirect_to '/'
    end
  end

  def new
    # secure via activities#edit
    @list = List.new
    @user = current_user
  end

  def create
    # secure via activities#edit
    @list = List.create(list_params)

    redirect_to activity_list_path(@list.activity_id, @list)
  end

  def show
    if list_user?
      @list = current_list
    else
      redirect_to '/'
    end
  end

  def update
    # get this logic out of here!
    # secure via activities
    @list = current_list
    if !params[:complete].nil?
      item_ids = params[:complete][:item_ids]
      item_ids.each do |id|
        @item = Item.find(id)
        @item.update!(complete: true)
      end

      redirect_to list_path(@list)
    else
      @item = Item.new(name: params[:items][:name],
              user_id: current_user.id,
              list_id: @list.id)
      if @item.save

        redirect_to list_path(@list)
      else
        @messages = @item.errors.each do |msg|
          msg
        end
        render :show
      end
    end
  end

  def destroy
    # secure via #show
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
