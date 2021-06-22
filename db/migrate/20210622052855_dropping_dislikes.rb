class DroppingDislikes < ActiveRecord::Migration[6.1]
  def change
  	drop_table :dislikes
  end
end
