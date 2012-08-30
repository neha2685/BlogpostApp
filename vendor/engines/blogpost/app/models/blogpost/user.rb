module Blogpost
  class User < ::User
    has_many :posts, :class_name => Blogpost::Post
    has_many :comments, :class_name => Blogpost::Comments
    has_many :votes, :class_name => Blogpost::Vote
  end
end