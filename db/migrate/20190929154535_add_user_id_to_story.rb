class AddUserIdToStory < ActiveRecord::Migration[6.0]
  def change
  	add_column :stories, :user_id, :integer
  end
end
