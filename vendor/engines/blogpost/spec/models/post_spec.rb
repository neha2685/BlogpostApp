require 'spec_helper'

describe Blogpost::Post do

  describe "Post model validations " do
    before(:each) do
      @user = FactoryGirl.create(:user)
      @post = FactoryGirl.create(:post,:user => @user)
    end

    it "model with content and with title" do
      @post.should be_valid
    end
    it "model without title and with content" do
      FactoryGirl.build(:post,:user => @user,:title=>nil,:content=>"abc").valid?.should be_false
    end
    it "model with title without content" do
      FactoryGirl.build(:post,:user => @user,:title=>"abc",:content=>nil).valid?.should be_false
    end
    it "model without title and without content" do
      FactoryGirl.build(:post,:user => @user,:title=>nil,:content=>nil).valid?.should be_false
    end
    it "model with title and with content and without user" do
      @post1.should be_false
    end
  end

  describe "checks model dependent attributes" do
    before(:each) do
      @user = FactoryGirl.create(:user)
      @post = FactoryGirl.create(:post,:user=>@user)
      @comment = FactoryGirl.create(:comment,:user=>@user,:post=>@post)
      @vote = FactoryGirl.create(:vote,:user=>@user,:votable=>@post)
    end
    it "owner of the post" do
      @post.user.should eq @user
    end
    it "has comments on post" do
      @post.comments.size.should be 1
    end
    it "has votes on post" do
      @post.votes.size.should be 1
    end
  end
end