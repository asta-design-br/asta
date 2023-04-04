class CreateAuctions < ActiveRecord::Migration[7.0]
  def change
    create_table :auctions do |t|
      t.references :product, null: false, foreign_key: true
      t.datetime :deadline
      t.boolean :open, default: false

      t.timestamps
    end
  end
end
