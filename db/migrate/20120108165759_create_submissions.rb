class CreateSubmissions < ActiveRecord::Migration
  def change
    create_table :submissions do |t|
      t.string :title, :null => false

      t.integer :content_id
      t.string :content_type

      t.timestamps
    end
    add_index :submissions, [:content_id, :content_type]
  end
end
