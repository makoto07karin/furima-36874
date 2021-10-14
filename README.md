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
|date                |date          |null: false                  |

### Association
has_many :items
has_many :orders



###items  
| Column        | Type         | Options                       |
|---------------|--------------|-------------------------------|
|category_id    |integer       |null: false                    |
|item           |string        |null: false                    |
|price          |integer       |null: false                    |
|item_state_id  |integer       |null: false                    |
|delivery_id    |integer       |null: false                    |
|area_id        |integer       |null: false                    |
|shipping_id    |integer       |null: false                    |
|user           |references    |null: false, foreign_key: true |
|item_info      |text          |null: false                    |


### Association
belongs_to :user
has_one :order  



######orders
| Column    | Type         | Options                       |
|-----------|--------------|-------------------------------|
|user       |references    |null: false, foreign_key: true |
|item       |references    |null: false, foreign_key: true |

### Association
has_one :address
belongs_to :item
belongs_to :user




#######addresses
| Column         | Type         | Options                       |
|----------------|--------------|-------------------------------|
|order           |references    |null: false, foreign_key: true |
|post_code       |string        |null: false                    |
|city            |string        |null: false                    |
|house_number    |string        |null: false                    |
|building_number |string        |                               |
|tel             |string        |null: false                    |
|area_id         |integer       |null: false                    |


### Association
belongs_to :order




