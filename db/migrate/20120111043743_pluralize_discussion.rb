class PluralizeDiscussion < ActiveRecord::Migration
  def change
    rename_table :discussion, :discussions
  end
end
