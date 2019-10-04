class AddTaggings < ActiveRecord::Migration[6.0]
  def change
  	add_column :taggings, :story_id, :integer
  	add_column :taggings, :tag_id, :integer
  end
end



