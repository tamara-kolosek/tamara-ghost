class AddContentToStory < ActiveRecord::Migration[6.0]
  def change
  	add_column :stories, :content, :string 
  end
end
