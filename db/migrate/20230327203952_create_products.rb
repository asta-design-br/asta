class CreateProducts < ActiveRecord::Migration[7.0]
  def change
    create_table :products do |t|
      t.references :event, null: false, foreign_key: true
      t.string :name
      t.string :description
      t.string :product_format
      t.integer :pixels_height
      t.integer :pixels_width
      t.integer :mm_height
      t.integer :mm_width
      t.integer :milliseconds_length
      t.integer :required_time
      t.string :category

      t.timestamps
    end
  end
end
