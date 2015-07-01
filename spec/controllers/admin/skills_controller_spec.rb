require "rails_helper"

describe Admin::SkillsController, type: :controller do
  describe "GET #index" do
    before {get :index}
    it {is_expected.to render_template :index}
  end

  describe "POST #create" do
    context "create skill" do
      subject {xhr :post, :create, {skill: FactoryGirl.attributes_for(:skill)}}
      it "should be valid when saved" do
        expect {subject}.to change(Skill, :count).by(1)
      end

      it "fallback value should be eq to subject's init" do
        expect(subject.body).to eql assigns(:skill).to_json
      end
    end
  end

  describe "PUT #update" do
    context "update skill" do
      subject {xhr :put, :update, {id: @skill, skill: JSON.parse(@skill.to_json)}}
      before do
        @skill = FactoryGirl.create :skill
        @skill.name = "rails"
        subject
      end
      it {expect(JSON.parse(response.body)["name"]).to eql "rails"}

      it "fallback value should be eq to subject's update" do
        expect(subject.body).to eql assigns(:skill).to_json
      end
    end
  end

  describe "DELETE #destroy" do
    context "delete skill" do
      subject {delete :destroy, {id: @skill}}
      before do
        @skill = FactoryGirl.create :skill
      end
      it {expect {subject}.to change(Skill, :count).by(-1)}
    end
  end
end
