class AddMarkdownFieldToStory < ActiveRecord::Migration[6.0]
  def change
  	add_column :stories, :markdown_content, :string
  end
end
