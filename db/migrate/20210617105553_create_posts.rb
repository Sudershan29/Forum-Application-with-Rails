class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|
      t.string :title
      t.string :content
      t.integer :likes
      t.integer :dislikes
      t.datetime :updatedat
      t.integer :userid

      t.timestamps
    end
    add_index :posts, :userid
  end
end
