class ToDoListsController < ApplicationController
  def new
    @to_do_list = ToDoList.new
  end

  def create
    raise params.inspect
    # params => "to_do_items"=>{"content"=>"buy stuff"}
    @to_do_list.create(list_params)

    redirect_to to_do_list_path(@to_do_list)
  end

  def show
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def list_params
    params.require(:to_do_lists).permit(:to_do_items[content], :bucket_item_id)
  end
end
