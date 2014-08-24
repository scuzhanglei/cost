class CreateEntries < ActiveRecord::Migration
  def change
    create_table :entries do |t|
      t.integer :user_id, null: false
      t.datetime :real_time, null: false
      t.string :desc, null: false, default: ''
      t.integer :cost_type_id, null: false
      t.integer :price, null: false, default: 0

      t.timestamps
    end
  end
end
