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
end
