class AddIndex < ActiveRecord::Migration
  def change
  	add_index :karma_points, [:user_id, :value]
  end
end
