class TeamsController < ApplicationController
  def index
    @teams = Team.all.paginate page: params[:page], 
      per_page: Settings.team.teams_number_per_page
  end
end