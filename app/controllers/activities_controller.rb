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

      redirect_to activity_path(@activity)
    else
      render :new
    end
  end

  def edit
    @activity = Activity.find(params[:id])
  end

  def update
    @activity = Activity.find(params[:id])
    if @activity.update(activity_params)

      redirect_to activity_path(@activity)
    else
      render :edit
    end
  end

  def show
    # if current_user == current_activity.user
    #   # session[:activity_id] = current_activity.id
      @activity = Activity.find(params[:id])
    #
    # else
    #   redirect_to '/'
    # end
  end

  private
  def activity_params
    params.require(:activity).permit(:title, :description, :due_date, :user_id)
  end
end
