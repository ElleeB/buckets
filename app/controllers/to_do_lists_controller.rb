class ToDoListsController < ApplicationController
  def new
    @to_do_list = ToDoList.new
  end

  def create
    @to_do_list = ToDoList.new(list_params)
    @to_do_list.user_id = current_user.id
    @to_do_list.bucket_item_id = current_bucket_item.id
    @to_do_list.save!

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
    params.require(:to_do_list).permit(:title)
  end
end
