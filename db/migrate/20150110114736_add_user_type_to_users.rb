class AddUserTypeToUsers < ActiveRecord::Migration
  def self.up
    change_table(:users) do |t|
      t.integer  :user_type, default: 0, null: false
    end
  end
end
