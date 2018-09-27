class ActivitiesController < ApplicationController

  def index
    ###
    @activities = current_user.activities.all
  end

  def new
    # make sure user is the owner of the account
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
    # make sure user is owner of activity
    @activity = Activity.find(params[:id])
    # params[:activity][:complete] means checked :complete
    if params.has_key?(:activity)
      if params[:activity][:complete] == '1'
        @activity.update(complete: true)
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
        # need to raise an error here
        redirect_to activity_path(@activity)
      end
    # standard update from activity/edit form
    elsif @activity.update(activity_params)

      redirect_to activity_path(@activity)
    else
      # error in standard edit-update - need to raise error
      render :edit
    end
  end

  def show
    if activity_user?
      @activity = Activity.find(params[:id])
      @list = List.find_by(activity_id: params[:id])
    else
      redirect_to '/'
    end
  end

  def destroy
    @activity = Activity.find(params[:id])
    @activity.delete

    redirect_to user_path(current_user.id)
  end

  private
  def activity_params
    params.require(:activity).permit(:title, :complete, :description, :due_date, :user_id,
                              lists: [:name])
  end
end
