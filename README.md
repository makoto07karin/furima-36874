#DB設計

##users

| Column             | Type         | Options                     |
|--------------------|--------------|-----------------------------|
|nickname            |string        |null: false                  |
|email               |string        |null: false, unique:true     |
|encrypted_password  |string        |null: false                  |
|family_name         |string        |null: false                  |
|name                |string        |null: false                  |
|family_kana         |string        |null: false                  |
|kana                |string        |null: false                  |
|date                |string        |null: false                  |

### Association
has_many :items


###items  
| Column        | Type         | Options                       |
|---------------|--------------|-------------------------------|
|category_id    |integer       |null: false                    |
|item           |string        |null: false                    |
|price          |integer       |null: false                    |
|exhibitor_id   |integer       |null: false                    |
|item_state_id  |integer       |null: false                    |
|delivery_id    |integer       |null: false                    |
|area_id        |integer       |null: false                    |
|shipping_id    |integer       |null: false                    |
|user           |references    |null: false, foreign_key: true |
|item_info      |text          |null: false                    |
|order          |references    |null: false, foreign_key: true |

### Association
belongs_to :users
belongs_to :orders

#itemはstringにすでOK!理由は255字までstringを使用してストレージの無駄を無くすため


######orders
| Column    | Type         | Options                       |
|-----------|--------------|-------------------------------|
|order      |references    |null: false, foreign_key: true |
|user       |references    |null: false, foreign_key: true |
|item       |string        |null: false                    |

### Association
has_one :addresses
has_many :items

#######addresses
| Column         | Type         | Options                       |
|----------------|--------------|-------------------------------|
|order           |references    |null: false, foreign_key: true |
|post_code       |string        |null: false                    |
|prefecture_id   |integer       |null: false                    |
|city            |string        |null: false                    |
|house_number    |string        |null: false                    |
|building_number |string        |                               |
|tel             |string        |null: false                    |
|order           |references    |null: false, foreign_key: true |
#post_code（郵便番号）はstring！理由は、ハイフンを使いたいから！
#電話番号はstring！理由はintegerだと先頭が０だと０が取り除いた状態で保存されるから！
### Association
belongs_to :orders