class CreateBlogpostVotes < ActiveRecord::Migration
  def change
    create_table :blogpost_votes do |t|
      t.integer :votable_id
      t.string :votable_type
      t.integer :user_id
      t.integer :value

      t.timestamps
    end
  end
end
