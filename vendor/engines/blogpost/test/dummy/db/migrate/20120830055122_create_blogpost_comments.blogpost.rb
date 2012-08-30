# This migration comes from blogpost (originally 20120826102625)
class CreateBlogpostComments < ActiveRecord::Migration
  def self.up
    create_table :blogpost_comments do |t|
      t.text :body
      t.integer :user_id
      t.integer :post_id

      t.timestamps
    end
  end

  def self.down
    drop_table :blogpost_comments
  end
end
