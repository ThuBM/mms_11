require "rails_helper"

describe Skill, type: :model do
  context "Test association" do
    let(:skill) {FactoryGirl.build(:skill)}
    it {expect(skill).to have_many(:user_skills)}
    it {expect(skill).to have_many(:users).through(:user_skills)}
  end
end
