class CreateStories < ActiveRecord::Migration[6.0]
  def change
    create_table :stories do |t|
      t.string :title
      t.datetime :last_edit
      t.string :part_of_the_content

      t.timestamps
    end
  end
end
