class CreateTags < ActiveRecord::Migration
  def change
    create_table :taggings, :id => false do |t|
      t.integer :tag_id, :null => false
      t.integer :submission_id, :null => false
      t.timestamps
    end
    add_index :taggings, [:tag_id, :submission_id]

    create_table :tags do |t|
      t.string :name, :null => false
      t.integer :tagging_id

      t.timestamps
    end
  end
end
