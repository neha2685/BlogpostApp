require 'spec_helper'

describe Blogpost::CommentsController do
  before :each do
    @routes = Blogpost::Engine.routes
    @user = FactoryGirl.create(:user)
    @user.stub(:dsm?).and_return(false)
    controller.stub!(:authenticate_user!).and_return(true)
    controller.stub(:check_users_permissions)
    controller.stub(:current_user).and_return(@user)
    @post = FactoryGirl.create(:post,:user=>@user)
    @comments = FactoryGirl.create(:comment,:post=>@post,:user=>@user)
  end

  describe "routing match with actions" do
    it "route for new comment page" do
      { :get => "/posts/1/comments/new" }.should route_to(:controller => "blogpost/comments",:action => "new",:post_id=>'1')
    end
  end

  describe "route paths validations for:" do
    it "comments show page" do
      new_post_comment_path(:post_id=>@post.id).should eq "/blog/posts/#{@post.id}/comments/new"
    end
  end

end