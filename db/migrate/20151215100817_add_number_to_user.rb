class AddNumberToUser < ActiveRecord::Migration
  def change
    add_column :users, :number, :float
  end
end
