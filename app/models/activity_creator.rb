class ActivityCreator
  def initialize(activity_params)
    @activity_params = activity_params
  end

  def process
   start_time = @activity_params.parse_time_select! :start_time
   end_time = @activity_params.parse_time_select! :end_time
   Activity.new.tap do |a|
     a.note = @activity_params[:note]
     a.start_time = start_time[:start_time]
     a.end_time = end_time[:end_time]
     a.category_title = @activity_params[:category_title]
     a.save
   end
  end
end
