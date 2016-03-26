require 'spec_helper'

describe User do 
  before(:each) do 
    @user = FactoryGirl.create(:user)
    @unauthorized_user = FactoryGirl.create(:user, :email => 'test@test.com')
  end

  describe ".email_domain" do
    it "returns an emails domain only" do
      @user.email_domain.should eq('gasvaluation.com')
    end
  end

  describe 'after CREATE' do
    it "marks authorized user as authorized" do
      @user.authorized.should be_true
    end

    it "marks unauthorized user as unauthorized" do
      @unauthorized_user.authorized.should be_false
    end
  end

end