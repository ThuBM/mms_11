class ActivitiesController < ApplicationController
  def index
    if Settings.activity.personal == params[:page_info]
      @activities = Activity.find_by user: current_user
      @activities.paginate page: params[:page] unless @activities.nil?
    else
      @activities = Activity.all.paginate page: params[:page]
    end
  end
end
