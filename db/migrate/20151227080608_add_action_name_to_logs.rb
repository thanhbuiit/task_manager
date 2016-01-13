class AddActionNameToLogs < ActiveRecord::Migration
  def change
    add_column :logs, :action_name, :string
  end
end
