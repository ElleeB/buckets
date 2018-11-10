class ActivitiesController < ApplicationController
  before_action :safe_set_activity, only: [:edit, :update, :show, :destroy]

  def index
    @activities = current_user_activities
  end

  def new
    @activity = Activity.new
  end

  def create
    if current_user?
      @activity = Activity.new(activity_params)
      @activity.user = current_user

      if @activity.save

        redirect_to activity_path(@activity)
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
      # params.has_key?(:complete) => checked "mark complete"
    if params[:activity] && params[:activity].has_key?(:complete)
      if params[:activity][:complete] == '1'
        @activity.mark_complete
        @user = current_user

        redirect_to user_path(@user)
      end
    #  if creating a new list associated with this activity
    elsif params[:lists]
      @list = List.new(name: params[:lists][:name])
      @list.activity_id = @activity.id
      @list.user_id = current_user.id
      if @list.save

        redirect_to list_path(@list)
      else
        @messages = @list.define_error_messages
        # redirect_to activity_path(@activity)
        render :show
      end
    # standard update from activity/edit form
    elsif @activity.update(activity_params)###ERROR this also has :activity key

      redirect_to activity_path(@activity)
    else
      @messages = @activity.define_error_messages
      render :edit
    end
  end

  def show
    @list = List.find_by(activity_id: params[:id])
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
