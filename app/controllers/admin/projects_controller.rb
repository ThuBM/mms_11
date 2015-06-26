class Admin::ProjectsController < ApplicationController
  def new
    @project = Project.new
  end

  def create
    @project = Project.new project_params
    if @project.save
      render json: @project
    else
      render json: @project.errors, status: :unprocessable_entity
    end
  end

  private
  def project_params
    params.require(:project).permit :id, :name, :abbreviation, :start_date, 
                                    :end_date, :leader_id, :team_id,
                                    members_attributes: [:id]
  end
end
