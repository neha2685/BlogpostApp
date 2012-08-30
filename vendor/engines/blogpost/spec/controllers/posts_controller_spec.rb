require 'spec_helper'

describe Blogpost::PostsController do
  before :each do
    @routes = Blogpost::Engine.routes
    @user = FactoryGirl.create(:user)
    @user.stub(:dsm?).and_return(false)
    controller.stub!(:authenticate_user!).and_return(true)
    controller.stub(:check_users_permissions)
    controller.stub(:current_user).and_return(@user)
    @post = FactoryGirl.create(:post,:user=>@user)
    @vote = FactoryGirl.create(:vote,:user=>@user,:votable=>@post)
  end

  describe "routing match with actions" do
    it "route for post page" do
      { :get => "/posts/1" }.should route_to(:controller => "blogpost/posts",:action => "show",:id=>'1')
    end
  end

  describe "route paths validations for:" do
    it "post show page" do
      posts_path(:id=>@post.id).should eq "/blog/posts?id=#{@post.id}"
    end
  end

  describe "test index and show functionality of post" do
    before :each do
      12.times{
          @post1 = FactoryGirl.create(:post,:user=>@user)
          @vote1 = FactoryGirl.create(:vote,:user=>@user,:votable=>@post)
      }
    end

    it "show post with given id" do
      get :show, :id=>@post.id
      assigns(:post).should be
    end

    it "get all posts" do
      get :index
      assigns(:posts).size.should > 1
    end
  end
end