require 'spec_helper'

describe Blogpost::VotesController do
  before :each do
    @routes = Blogpost::Engine.routes
    @user = FactoryGirl.create(:user)
    @user.stub(:dsm?).and_return(false)
    controller.stub!(:authenticate_user!).and_return(true)
    controller.stub(:check_users_permissions)
    controller.stub(:current_user).and_return(@user)
    @post = FactoryGirl.create(:post,:user=>@user)
    @comments = FactoryGirl.create(:comment,:post=>@post,:user=>@user)
    @votep = FactoryGirl.create(:vote,:user=>@user,:votable=>@post)
    @votec = FactoryGirl.create(:vote,:user=>@user,:votable=>@comments)
  end

  describe "routing match with actions" do
    it "vote post update" do
      { :get => "/votes/1/vote_up_post" }.should route_to(:controller => "blogpost/votes",:action => "vote_up_post",:id=>'1')
    end
    it "vote comment update" do
      { :get => "/votes/1/vote_up_comment" }.should route_to(:controller => "blogpost/votes",:action => "vote_up_comment",:id=>'1')
    end
  end

  describe "testing valid response hit for: " do
    it "vote update for post" do
      post = FactoryGirl.create(:post,:title=>"asdasdasd",:content=>"asdasdasd",:user=>@user)
      get :vote_up_post,:id=>post.id
      assigns(:count).should eq 1
      assigns(:id).should eq post.id
    end
    it "vote update for comment" do
      comment = FactoryGirl.create(:comment,:body=>"asd",:post=>@post,:user=>@user)
      get :vote_up_comment,:id=>comment.id
      assigns(:count2).should eq 1
      assigns(:id2).should eq comment.id
    end
  end

  describe "testing if already voted" do
    it "already vote for post" do
      get :vote_up_post,:id=>@post.id
      assigns(:notice).should eq "You already voted"
    end

    it "already vote for comment" do
      get :vote_up_comment,:id=>@comments.id
      assigns(:notice2).should eq "You already voted"
    end
  end
end