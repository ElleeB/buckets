class ListsController < ApplicationController
  def index
    if logged_in? && params[:activity_id]
      @activity = current_activity
    elsif logged_in?
      @lists = current_user.lists
      render json: @lists
    else
      redirect_to '/'
    end
  end

  def new
    # secure via activities#edit
    @list = List.new
  end

  def create
    # secure via activities#edit
    @list = List.create(list_params)
    respond_to do |format|
      format.json { render json: @list, status: 200}
      format.html { redirect_to list_path(@list) }
    end
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
    # secured via activities
    @list = current_list
    if !params[:complete].nil?
      # marked item complete
      item_ids = params[:complete][:item_ids]
      item_ids.each do |id|
        @list.mark_item_complete(id)
      end

      redirect_to list_path(@list)
    else
      @item = Item.new(name: params[:items][:name],
              user_id: current_user.id,
              list_id: @list.id)
      if @item.save

        redirect_to list_path(@list)
      else
        @messages = @item.define_error_messages
        render :show
      end
    end
  end

  def destroy
    # secured via #show
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
