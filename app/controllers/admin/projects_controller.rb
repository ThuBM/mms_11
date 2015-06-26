class Admin::ProjectsController < ApplicationController
  def index
    @projects = Project.paginate page: params[:page], 
                                 per_page: Settings.project.num_per_page
  end
end
