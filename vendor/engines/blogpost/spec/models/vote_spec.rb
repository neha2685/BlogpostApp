require 'spec_helper'

describe Blogpost::Vote do

  describe "Vote model validations " do
    before(:each) do
      @user = FactoryGirl.create(:user)
      @post = FactoryGirl.create(:post,:user => @user)
      @comment = FactoryGirl.create(:comment,:user=>@user,:post=>@post)
      @vote = FactoryGirl.create(:vote,:votable=>@post,:user=>@user)
      @vote1 = FactoryGirl.create(:vote,:votable=>@comment,:user=>@user)
    end

    it "valid vote model for votes on posts" do
      @vote.should be_valid
    end
    it "valid vote model for votes on comments" do
      @vote1.should be_valid
    end
    it "model without user" do
      FactoryGirl.build(:vote,:user => nil,:votable => @post).valid?.should be_false
    end
    it "model with user id and without votable type" do
      FactoryGirl.build(:vote,:user => @user,:votable => nil).valid?.should be_false
    end
    it "model without user id and without votable type" do
      FactoryGirl.build(:vote,:user => nil,:votable => nil).valid?.should be_false
    end
  end
end