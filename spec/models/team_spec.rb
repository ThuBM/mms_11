require "rails_helper"

describe Team, type: :model do
  context "test has_many" do
    let(:team) {FactoryGirl.build(:team)}
    it {expect(team).to have_many(:members).through(:user_teams)}
    it {expect(team).to have_many(:user_teams)}
    it {should belong_to(:leader).class_name("User").inverse_of(:team)}
  end
end
