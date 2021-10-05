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
#dateはdate型を使うことで無効な日付データの保存ができる！
### Association
has_many :items
has_many :orders

#user一人に対して購入情報は一つではないusersはいくつも購入できる！

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
#userカラムで出品者の情報を管理する！

### Association
belongs_to :user
has_one :order  

#itemテーブルから見てordersテーブルは子の関係になる！商品がないと購入はできない！
#itemはstringにすでOK!理由は255字までstringを使用してストレージの無駄を無くすため
#テーブルだけと単数形なのは、belongs_toの場合は所有先のモデルを単数形にしないと正常に動作しないから！

######orders
| Column    | Type         | Options                       |
|-----------|--------------|-------------------------------|
|user       |references    |null: false, foreign_key: true |
|item       |references    |null: false, foreign_key: true |

### Association
has_one :address
belongs_to :item
belongs_to :user

#has_oneの場合もbelongs_toと同様に単数形でOK！


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

#post_code（郵便番号）はstring！理由は、ハイフンを使いたいから！
#電話番号はstring！理由はintegerだと先頭が０だと０が取り除いた状態で保存されるから！
#都道府県はitemsでarea_id代用できる！
### Association
belongs_to :order



#アソシエーションを考えるときは、対象同士のみの関係性で考えると
シンプルでわかりやすい！
#代用できるものは代用する！そしてストレージの無駄を省く！
#今回ER図とREADMEを学習して感じたのは、ここでテーブルとカラムとアソシエーションを詰めておく必要がある
なぜか
私の感じたことだが総じてアプリの情報と内容の簡略化を感じた
理由はここですでにモデルに関してもviewに関しても先を見越した記述を求められたからだ
ストレージの無駄を省くや、アソシエーションのチェック、IDの使い回し
これらは、先を見越していなければ考えつかない内容だと考える
そして全体の構成を考えていないと私の様に行き当たりばったりな内容になってしまう
だから、ここで情報を詰めたのだと感じた
