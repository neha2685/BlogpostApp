module Blogpost
  class Comments < ActiveRecord::Base

    validates_presence_of :body
    belongs_to :post, :class_name => Blogpost::Post
    belongs_to :user, :class_name => Blogpost::User
    has_many :votes, :as => :votable, :class_name => Blogpost::Vote
  end
end
