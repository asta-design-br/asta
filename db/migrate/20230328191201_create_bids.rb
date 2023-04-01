class CreateBids < ActiveRecord::Migration[7.0]
    def change
      create_table :bids do |t|
        t.references :user, null: false, foreign_key: true
        t.references :auction, null: false, foreign_key: true
  
        t.timestamps
      end
    end
  end