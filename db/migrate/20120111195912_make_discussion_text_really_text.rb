class MakeDiscussionTextReallyText < ActiveRecord::Migration
  def change
    change_column :discussions, :text, :text, :null => false
  end
end
