class ActivitiesController < ApplicationController
  def new
    @activity = Activity.new
  end

  def index
    @activity = Activity.new
    @activities = Activity.all
  end

  def edit
    @activity = Activity.find(params[:id])
  end

  def update
    start_time = params[:activity].parse_time_select! :start_time
    end_time = params[:activity].parse_time_select! :end_time
    activity = Activity.find(params[:id])
    activity.update_attributes(note: params[:activity][:note],
                               start_time: start_time[:start_time],
                               end_time: end_time[:end_time],
                               category_title: params[:activity][:category_title])
    redirect_to activities_path
  end

  def create
    start_time = params[:activity].parse_time_select! :start_time
    end_time = params[:activity].parse_time_select! :end_time
    Activity.new.tap do |a|
      a.note = params[:activity][:note]
      a.start_time = start_time[:start_time]
      a.end_time = end_time[:end_time]
      a.category_title = params[:activity][:category_title]
      a.save
    end
    redirect_to :back, flash: { success: "Activity Created" }
  end

  def show
    @activity = Activity.find(params[:id])
  end

  def destroy
    @activity = Activity.find(params[:id])
    @activity.destroy
    redirect_to :back
  end

  private
  def activity_params
    params.require(:activity).permit(:start_time, :end_time, :note)
  end
end
