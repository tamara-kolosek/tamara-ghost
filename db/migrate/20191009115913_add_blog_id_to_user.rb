class AddBlogIdToUser < ActiveRecord::Migration[6.0]
  def change
  	add_column :users, :blog_id, :integer
  end
end
