class RemoveAddressableFromAddresses < ActiveRecord::Migration[7.0]
  def change
    remove_reference :addresses, :addressable
  end
end
