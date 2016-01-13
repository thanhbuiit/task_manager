class AddHiddenToLists < ActiveRecord::Migration
  def change
    add_column :lists, :hidden, :boolean
  end
end
