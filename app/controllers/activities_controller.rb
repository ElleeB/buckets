class ActivitiesController < ApplicationController
  before_action :safe_set_activity, only: [:edit, :update, :show, :destroy]

  def index
    @activities = current_user_activities
    respond_to do |format|
      format.json { render json: @activities }
      format.html { render :index }
    end
  end

  def new
    @activity = Activity.new
  end

  def create
    if current_user?
      @activity = Activity.new(activity_params)
      @activity.user = current_user

      if @activity.save
        category = Category.find(params[:activity][:category_id])

        render json: @activity, status: 200
      else
        @messages = @activity.define_error_messages
        render :new
      end
    else
      redirect_to '/'
    end
  end

  def edit
  end

  def update
    #  if creating a new list associated with this activity #
    if params[:lists] && params[:lists][:name] != ""
      @list = List.create(name: params[:lists][:name], activity_id: @activity.id, user_id: params[:activity][:user_id])

      render json: @list

    # if params.has_key?(:complete) => checked "mark complete" #
    # elsif params[:activity] && params[:activity].has_key?(:complete)
    #   if params[:activity][:complete] == '1'
    #     @activity.mark_complete
    #     @user = current_user
    #
    #     redirect_to user_path(@user)
    #   end

    # standard update from activity/edit form #
    else @activity.update(activity_params)###ERROR this also has :activity key
      raise params.inspect
      render json: @activity, status: 200
    # else
    #   @messages = @activity.define_error_messages
    #   render :edit
    end
  end

  def show
    @activity = current_activity

    respond_to do |format|
      format.json { render json: @activity, status: 200 }
      format.html { render :show }
    end
  end

  def destroy
    @activity.delete

    redirect_to user_path(current_user.id)
  end

  private

  def safe_set_activity
    if activity_user?
      @activity = current_activity
    else
      redirect_to '/'
    end
  end

  def activity_params
    params.require(:activity).permit(:title, :complete, :description, :due_date, :user_id, :category_id,
                              lists: [:name])
  end
end
