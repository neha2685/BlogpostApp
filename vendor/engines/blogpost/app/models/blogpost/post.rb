module Blogpost
  class Post < ActiveRecord::Base

    belongs_to :user, :class_name => Blogpost::User
    has_many :comments, :class_name => Blogpost::Comments
    has_many :votes, :as => :votable, :class_name => Blogpost::Vote

    validates :title, :content,:user, :presence => true

  end
end
