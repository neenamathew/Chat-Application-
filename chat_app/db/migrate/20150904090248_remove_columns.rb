class RemoveColumns < ActiveRecord::Migration
def self.up
  remove_column :messages, :user
end
def self.down
  add_column :messages, :user_name, :string
end
end
