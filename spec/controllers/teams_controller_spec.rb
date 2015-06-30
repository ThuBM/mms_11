require "rails_helper"

describe TeamsController, type: :controller do
  describe "GET index" do
    before {get :index}
    subject {response}
    it {is_expected.to be_success}
  end

  describe "GET show" do
    let(:team) {FactoryGirl.create :team}
    before {get :show, id: team}
    subject {response}
    it {is_expected.to be_success}
  end
end
