class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
      t.references :order,               null: false,  foreign_key: true
      t.string     :post_code,           null: false
      t.string     :city,                null: false
      t.string     :house_number,        null: false
      t.string     :building_numberty, null: false
      t.string     :tel,                 null: false
      t.integer    :area_id,             null: false

      t.timestamps
    end
  end
end
