class Admin::ProjectsController < ApplicationController
  def new
    @project = Project.new
    @members = User.all
  end
end
