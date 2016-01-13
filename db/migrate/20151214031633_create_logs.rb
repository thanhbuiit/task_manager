class CreateLogs < ActiveRecord::Migration
  def change
    create_table :logs do |t|
      t.datetime :date_update
      t.references :log, polymorphic: true, index: true 
      t.timestamps null: false
    end

  end
end
