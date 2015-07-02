require "rails_helper"
require "will_paginate/array"
require 'capybara/rails'

describe "teams/index.html.erb" do
  subject {rendered}
  before do
    @teams = []
    40.times {@teams << FactoryGirl.create(:team)}
    @teams = @teams.paginate page: params[:page],
      per_page: Settings.team.teams_number_per_page
  end

  it "shoud valid when request true" do
    render @teams
    expect(controller.request.path_parameters[:controller]).to eq "teams"
    expect(controller.request.path_parameters[:action]).to eq "index"
  end

  it "should valid when contains team name" do
    render @teams
    @teams.each {|team| is_expected.to include team.name}
  end

  it "should invalid when not contains team's members count" do
    render @teams
    @teams.each {|team| is_expected.to include team.members.count }
  end

  describe "empty teams" do
    before {@teams = []}

    it "should valid when announce empty team" do
      @teams = @teams.paginate page: params[:page],
        per_page: Settings.team.teams_number_per_page
      render
      expect(rendered).to include "Not have team."
    end
  end
end
