class CreateAddresses < ActiveRecord::Migration[7.0]
  def change
    create_table :addresses do |t|
      t.string  :postal_code,  null: false
      t.string  :prefecture,   null: false
      t.integer :city,         null: false
      t.integer :addresses,    null: false
      t.string  :building,     null: false
      t.string  :phone_number, null: false
      t.references :order,     null: false, foreign_key: true
      t.timestamps
    end
  end
end
