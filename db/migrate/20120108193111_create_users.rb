class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :provider
      t.string :username
      t.string :email
      t.string :uid

      t.timestamps
    end
    add_index :users, [:provider,:uid]
  end
end
