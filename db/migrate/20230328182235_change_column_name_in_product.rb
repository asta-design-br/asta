class ChangeColumnNameInProduct < ActiveRecord::Migration[7.0]
  def change
    rename_column :products, :format, :product_format
  end
end
