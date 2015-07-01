require "rails_helper"
require 'byebug'

describe Admin::ProjectsController, type: :controller do
  describe "GET index" do
    before {get :index}
    subject {response}
    it {is_expected.to render_template :index}
  end

  describe "GET new" do
    before {get :new}
    subject {response}
    it {is_expected.to render_template :new}
  end

  describe "POST create" do
    context "create project" do
      subject {xhr :post, :create,
        {project: FactoryGirl.attributes_for(:project), is_submit: true}}

      it "should valid when saved" do
        expect {subject}.to change(Project, :count).by(1)
      end

      it "should valid when returned json equal project infor after save" do
        expect(subject.body).to eql assigns(:project).to_json
      end
    end

    context "render members via AJAX" do
      before do
        @team = FactoryGirl.create :team
        @user_ids = []
        10.times {@user_ids << FactoryGirl.create(:user).id}
        @team.member_ids = @user_ids
        @team.save
        xhr :post, :create, {is_submit: false, team_id: @team.id}
        @response_ids = []
        JSON.parse(response.body).each {|obj| @response_ids << obj["id"]}
      end

      it {expect(@response_ids).to eql @user_ids}
    end
  end
end
