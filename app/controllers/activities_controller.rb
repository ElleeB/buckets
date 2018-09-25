class ActivitiesController < ApplicationController

  def index
    @activities = current_user.activities.all
  end

  def new
    # make sure user is the owner of the activity
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
    # make sure user is the owner of the activity
    @activity = Activity.find(params[:id])
  end

  def update
    @activity = Activity.find(params[:id])
    if params[:lists][:name]
      @list = List.new(name: params[:lists][:name])
      @list.activity_id = @activity.id
      @list.user_id = current_user.id

      if @list.save

        redirect_to activity_path(@activity)
      else
        redirect_to activity_path(@activity)
      end



    elsif @activity.update(activity_params)

      redirect_to activity_path(@activity)
    else
      render :edit
    end
  end

  def show
    # make sure user is the owner of the activity!!!

      @activity = Activity.find(params[:id])
      @list = List.find_by(activity_id: params[:id])
  end

  private
  def activity_params
    params.require(:activity).permit(:title, :description, :due_date, :user_id,
                                      lists: [:name])
  end
end
