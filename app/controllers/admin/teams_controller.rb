class Admin::TeamsController < Admin::AdminController
  def index
    @teams = Team.all
    @users = User.all
  end

  def new
    @team = Team.new
  end

  def create
    @team = Team.create team_params
    if @team.save
      render json: @team
    else
      render :new
    end
  end

  private
  def team_params
    params.require(:team).permit :id, :name, :description, :leader_id,
                                  member_ids: []
  end
end
