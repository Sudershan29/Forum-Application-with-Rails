class FixingColumnName < ActiveRecord::Migration[6.1]
  def change
  	 rename_column :posts, :likes, :upvotes
  	 rename_column :posts, :dislikes, :downvotes
  end
end
