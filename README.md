#DB設計

##users

| Column             | Type         | Options                     |
|--------------------|--------------|-----------------------------|
|nickname            |string        |null: false                  |
|email               |string        |null: false                  |
|encrypted_password  |string        |null: false                  |
|name                |string        |null: false                  |
|kana                |string        |null: false                  |
|date_of_birth       |string        |null: false                  |

### Association
has_many :item


###items
| Column    | Type         | Options                       |
|-----------|--------------|-------------------------------|
|item       |text          |null: false                    |
|price      |integer       |null: false                    |
|exhibitor  |string        |null: false                    |
|item_state |string        |null: false                    |
|delivery   |string        |null: false                    |
|area       |string        |null: false                    |
|shipping   |string        |null: false                    |
|user       |references    |null: false, foreign_key: true |
|item_info  |text          |null: false                    |
|user       |references    |null: false, foreign_key: true |
### Association
belongs_to :user
has_many   :order, through:item_order
has_many   :item_order


#####item_order
| Column    | Type         | Options                       |
|-----------|--------------|-------------------------------|
|item_up    |references    |null: false, foreign_key: true |
|order      |references    |null: false, foreign_key: true |

### Association
belongs_to :item
belongs_to :order

######orders
| Column    | Type         | Options                       |
|-----------|--------------|-------------------------------|
|order      |references    |null: false, foreign_key: true |

### Association
has_one :addresses
has_many:item_order
has_many:items, through:item_order

#######addresses
| Column         | Type         | Options                       |
|----------------|--------------|-------------------------------|
|order           |references    |null: false, foreign_key: true |
|post_code       |integer       |null: false                    |
|prefecture      |id            |                               |
|city            |string        |null: false                    |
|house_number    |integer       |null: false                    |
|building_number |text          |null: false                    |
|tel             |integer       |null: false                    |
|order           |references    |null: false, foreign_key: true |


### Association
belongs_to :orders