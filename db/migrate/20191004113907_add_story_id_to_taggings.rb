class AddStoryIdToTaggings < ActiveRecord::Migration[6.0]
  def change
  	add_column :taggings, :story_id, :integer
  end
end
