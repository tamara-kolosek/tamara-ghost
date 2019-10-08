class AddAccessField < ActiveRecord::Migration[6.0]
  def change
  	add_column :users, :team, :array
  end
end
