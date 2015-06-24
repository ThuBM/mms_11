class TeamsController < ApplicationController
  def index
    @teams = Team.all.paginate page: params[:page], 
      per_page: Settings.team.teams_number_per_page
  end

  def show
    @team = Team.find params[:id]
    @members = @team.members.paginate page: params[:page], 
      per_page: Settings.team.teams_number_per_page
  end
end
