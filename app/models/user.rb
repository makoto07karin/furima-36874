class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  #validatesの設定をするが確か
  with_options presence: true do
    validates :family_name, format: {with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, length: { maximum: 6 }}
    validates :name,        format: {with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/}
  
  #一度本物がどう動作しているか確認する10/6１つのフォームからを参照
    validates :family_kana, format: {with: /\A[ァ-ヶー]+\z/}
    validates :kana,        format: {with: /\A[ァ-ヶー]+\z/}
  end


  validates :nickname,    presence: true
  validates :date,        presence: true

  # Association
  has_many :items
  has_many :orders
end



#emailとencrypted_passwordに関しては、deviseの機能で入力時の制限がかかっている
#なので、それ以外は記述する必要がある