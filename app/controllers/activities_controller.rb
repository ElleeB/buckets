class ActivitiesController < ApplicationController

  def index
    @activities = current_user.activities.all
  end

  def new
    @activity = Activity.new
  end

  def create
    @activity = Activity.new(activity_params)
    @activity.user = current_user
    if @activity.save

      # session[:activity_id] = @activity.id
      redirect_to activity_path(@activity)
    else
      render :new
    end
  end

  def edit
    current_activity
  end

  def update
    current_activity
    if @activity.update(activity_params)

      redirect_to activity_path(@activity)
    else
      render :edit
    end
  end

  def show
    session[:activity_id] = current_activity.id
    current_activity
  end

  private
  def activity_params
    params.require(:activity).permit(:title, :description, :due_date, :user_id)
  end
end
