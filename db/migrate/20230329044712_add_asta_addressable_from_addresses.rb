class AddAstaAddressableFromAddresses < ActiveRecord::Migration[7.0]
  def change
    add_reference :addresses, :asta_addressable, polymorphic: true, null: false, index: true
  end
end
