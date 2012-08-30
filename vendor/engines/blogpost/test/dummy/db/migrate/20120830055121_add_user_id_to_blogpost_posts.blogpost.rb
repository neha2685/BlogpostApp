# This migration comes from blogpost (originally 20120824114549)
class AddUserIdToBlogpostPosts < ActiveRecord::Migration
  def change
    add_column :blogpost_posts, :user_id, :integer
  end
end
