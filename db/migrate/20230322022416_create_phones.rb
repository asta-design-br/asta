class CreatePhones < ActiveRecord::Migration[7.0]
  def change
    create_table :phones do |t|
      t.references :phonable, polymorphic: true, null: false
      t.string :number
      t.string :country_code

      t.timestamps
    end
  end
end
