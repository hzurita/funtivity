class ActivitiesController < ApplicationController

  def show
    id = params[:id] # retrieve movie ID from URI route
    @activity = Activity.find(id) # look up movie by unique ID
    # will render app/views/movies/show.<extension> by default
  end

  def index
    @activities = Activity.all
  end

  def new
    # default: render 'new' template
  end

  def create
    @activity = Activity.create!(params[:activity])
    flash[:notice] = "#{@activity.title} was successfully created."
    redirect_to activities_path
  end

  def edit
    @activity = Activity.find params[:id]
  end

  def update
    @activity = Activity.find params[:id]
    @activity.update_attributes!(params[:activity])
    flash[:notice] = "#{@activity.title} was successfully updated."
    redirect_to activity_path(@activity)
  end

  def destroy
    @activity = Activity.find params[:id]
    @activity.destroy
    flash[:notice] = "Activity '#{@activity.title}' deleted."
    redirect_to activities_path
  end
  
  private

  def act_params
    params.require(:activity).permit(:title, :act_type, :description)
  end
end