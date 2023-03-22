class RenameAddressableToAstaAddressable < ActiveRecord::Migration[7.0]
  def change
    rename_column :addresses, :addressable_type, :asta_addressable_type
    rename_column :addresses, :addressable_id, :asta_addressable_id
  end
end
