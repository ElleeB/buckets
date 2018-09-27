class ActivitiesController < ApplicationController

  def index
    @activities = current_user_activities
  end

  def new
    @activity = Activity.new
  end

  def create
    if activity_user?
      @activity = Activity.new(activity_params)
      @activity.user = current_user
      if @activity.save

        redirect_to activity_path(@activity)
      else
        render :new
      end
    else
      redirect_to '/'
    end
  end

  def edit
    if activity_user?
      @activity = Activity.find(params[:id])
    else
      redirect_to '/'
    end
  end

  def update
    if activity_user?
      @activity = Activity.find(params[:id])
      # params.has_key?(:activity) means checked :complete = true
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
    else
      redirect_to '/'
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
    if activity_user?
      @activity = Activity.find(params[:id])
      @activity.delete

      redirect_to user_path(current_user.id)
    else
      redirect_to '/'
    end
  end

  private
  def activity_params
    params.require(:activity).permit(:title, :complete, :description, :due_date, :user_id,
                              lists: [:name])
  end
end
