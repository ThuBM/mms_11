class UsersController < ApplicationController
  def show
    @user = User.find params[:id]
    @team = @user.teams.last
  end
end
