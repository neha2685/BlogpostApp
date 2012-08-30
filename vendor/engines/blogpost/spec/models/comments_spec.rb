require 'spec_helper'

describe Blogpost::Comments do

  describe "Comment model validations " do
    before(:each) do
      @user = FactoryGirl.create(:user)
      @post = FactoryGirl.create(:post,:user => @user)
      @comment = FactoryGirl.create(:comment,:user=>@user,:post=>@post)
    end

    it "valid model" do
      @comment.should be_valid
    end
    it "model without body" do
      FactoryGirl.build(:comment,:user => @user,:body=>nil,:post=>@post).valid?.should be_false
    end
    it "model with body and without post id" do
      FactoryGirl.build(:comment,:user => @user,:post=>nil).valid?.should be_false
    end
    it "model without user id" do
      FactoryGirl.build(:comment,:user => nil,:post=>@post).valid?.should be_false
    end
  end

  describe "checks model dependent attributes" do
    before(:each) do
      @user = FactoryGirl.create(:user)
      @post = FactoryGirl.create(:post,:user=>@user)
      @comment = FactoryGirl.create(:comment,:user=>@user,:post=>@post)
      @vote = FactoryGirl.create(:vote,:user=>@user,:votable=>@comment)
    end
    it "owner of the comment" do
      @comment.user.should eq @user
    end
    it "has votes on comment" do
      @comment.votes.size.should be 1
    end
  end
end