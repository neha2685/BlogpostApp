require 'spec_helper'

describe Blogpost::Post do
  before(:each) do
    @user = FactoryGirl.create(:user)
    @post = FactoryGirl.create(:post)
  end
  describe "Post model validations " do
    it "should be valid" do
      @post.should be_valid
    end
    it "model without title" do
      
    end
  end


end