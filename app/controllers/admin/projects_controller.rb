class Admin::ProjectsController < ApplicationController
  def new
    @project = Project.new
    @teams = Team.all
    #@members = Team.find(params[:team_id]).members unless params[:id].nil?
    @members = User.all
  end
end
