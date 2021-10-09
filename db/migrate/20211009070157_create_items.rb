class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.integer    :category_id,   null: false
      t.string     :item,          null: false
      t.integer    :price,         null: false
      t.integer    :item_state_id, null: false
      t.integer    :delivery_id,   null: false
      t.integer    :area_id,       null: false
      t.integer    :shipping_id,   null: false
      t.references :user,          null: false,  foreign_key: true
      t.text       :item_info,     null: false

      t.timestamps
    end
  end
end
