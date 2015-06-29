require "rails_helper"

describe User, type: :model do
  before do
    @user = FactoryGirl.build :user
  end

  it "should is valid" do
    expect(@user).to be_valid
  end

  context "Email" do
    it "should invalid when empty" do
      @user.email = nil
      expect(@user).not_to be_valid
    end

    it "should be uniqueness" do
      @user.email = "thubm@gmail.com"
      @user.save
      other_user = FactoryGirl.build :user
      other_user.email = "thubm@gmail.com"
      expect(other_user).not_to be_valid
    end

    it "should invalid when wrong format" do
      @user.email = "thubm.abc.com"
      expect(@user).not_to be_valid
    end

    it "should down-case after save" do
      @user.email = "THUbm@gmail.com"
      @user.save
      expect(@user.email).to eql "thubm@gmail.com"
    end
  end

  context "Password" do
    it "should invalid when empty" do
      @user.password = ""
      @user.password_confirmation = ""
      @user.save
      expect(@user).not_to be_valid
    end

    it "should invalid when length smaller than 8" do
      @user.password = "12345"
      @user.password_confirmation = "12345"
      @user.save
      expect(@user).not_to be_valid
    end

    it "should invalid when password different with password_confimation" do
      @user.password = "1234567890"
      @user.password_confirmation = "123467842"
      @user.save
      expect(@user).not_to be_valid
    end
  end

  describe "test associations" do
    context "Positions" do
      before do
        @positions = []
        10.times {@positions << FactoryGirl.build(:position)}
      end

      it "should valid when user has_many positions" do
        @user.positions = @positions
        @user.save
        expect(@user).to be_valid
      end
    end

    context "Teams" do
      before do
        @teams = []
        10.times {@teams << FactoryGirl.build(:team)}
      end

      it "should valid when user has_many teams" do
        @user.teams = @teams
        @user.save
        expect(@user).to be_valid
      end

      it "should valid when user has no teams" do
        @user.teams = []
        @user.save
        expect(@user).to be_valid
      end
    end

    context "Skills" do
      before do
        @skills = []
        10.times {@skills << FactoryGirl.build(:skill)}
      end

      it "shoud valid when user has 10 skills" do
        @user.skills = @skills
        @user.save
        expect(@user.skills.count).to eql 10
      end

      it "should valid when user has no skills" do
        @user.skills = []
        @user.save
        expect(@user.skills.count).to eql 0
      end
    end

    context "Projects" do
      before do
        @projects = []
        10.times {@projects << FactoryGirl.build(:project)}
      end

      it "should valid when user has 10 projects" do
        @user.projects = @projects
        @user.save
        expect(@user.projects.count).to eql 10
      end

      it "should valid when user has no projects" do
        @user.projects = []
        @user.save
        expect(@user.projects.count).to eql 0
      end
    end

    context "Team" do
      before do
        @teams = []
        10.times {@teams << FactoryGirl.build(:team_with_leader, {leader: @user})}
        @team = FactoryGirl.build :team
      end

      it "should invalid when user's team is not existed in user's teams" do
        @user.team = @team
        @user.teams = @teams
        expect(@user.teams).not_to include @user.team
      end

      it "should valid when user's teams contained user's team" do
        @user.teams = @teams
        @user.team = @teams.first
        expect(@user.teams).to include @user.team
      end

      it "should valid when team's leader is user" do
        @user.team = @team
        @user.save
        expect(@team.leader).to eql @user
      end
    end
  end
end
