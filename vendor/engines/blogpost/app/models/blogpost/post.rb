module Blogpost
  class Post < ActiveRecord::Base
    attr_accessible :content, :title

    belongs_to :user, :class_name => Blogpost::User
    has_many :comments, :class_name => Blogpost::Comments
  end
end
