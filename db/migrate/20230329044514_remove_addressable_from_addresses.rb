class RemoveAddressableFromAddresses < ActiveRecord::Migration[7.0]
  def change
    remove_reference :addresses, :addressable
    remove_column :addresses, :addressable_type
  end
end
