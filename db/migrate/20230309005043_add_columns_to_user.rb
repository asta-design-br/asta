class AddColumnsToUser < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :username, :string
    add_column :users, :full_name, :string
    add_column :users, :profile, :text
    add_column :users, :document, :string
  end
end
