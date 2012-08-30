module Blogpost
  class Vote < ActiveRecord::Base

    belongs_to :votable, :polymorphic => true
    belongs_to :user, :class_name => Blogpost::User
  end
end
