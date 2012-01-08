class Discussion < ActiveRecord::Migration
  def change
    create_table :discussion do |t|
      t.string :text, :null => false

      t.timestamps
    end
  end
end
