class AddColumns < ActiveRecord::Migration
  def self.up
  add_column :messages, :user_name, :string
end
end
