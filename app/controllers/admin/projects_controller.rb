class Admin::ProjectsController < Admin::AdminController
  def index
    @project = Project.new
    @teams = Team.all
  end

  def new
    @project = Project.new
  end

  def create
    if request.xhr?
      unless params[:is_submit] == false
        @project = Project.new project_params
        @project.members = @project.team.members unless @project.team.nil?
        if @project.save
          render json: @project
        else
          render json: @project.errors, status: :unprocessable_entity
        end
      else
        @members = Team.find_by(id: params[:team_id]).members
        render json: @members
        return
      end
    end
  end

  private
  def project_params
    params.require(:project).permit :id, :name, :abbreviation, :start_date,
                                    :end_date, :leader_id, :team_id
  end
end
