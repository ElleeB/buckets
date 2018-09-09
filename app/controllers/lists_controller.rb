class ListsController < ApplicationController
  def index
  end

  def new
    @list = List.new
  end

  def create
    @list = List.create(list_params)

    redirect_to activity_list_path(current_activity, @list)
  end

  def show
    @list = List.find(params[:id])
  end

  private

  def list_params
    params.require(:list).permit(:name, :activity_id)
  end
end
