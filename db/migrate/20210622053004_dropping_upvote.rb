class DroppingUpvote < ActiveRecord::Migration[6.1]
  def change
  	drop_table :upvotes
  end
end
