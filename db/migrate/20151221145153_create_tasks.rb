class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :name
      t.string :description
      t.string :hidden
      t.references :list
      t.timestamps null: false
    end
  end
end
