class CreateSteps < ActiveRecord::Migration[7.0]
  def change
    create_table :steps do |t|
      t.references :bid, null: false, foreign_key: true
      t.integer :sequence_id
      t.string :title
      t.text :notes
      t.integer :price_cents
      t.datetime :due_date
      t.boolean :approved

      t.timestamps
    end
  end
end
