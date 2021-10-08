class User < ApplicationRecord
 
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  #validatesの設定をするが確か
  with_options presence: true, format: {with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, allow_blank: true} do
    validates :family_name
    validates :name        
  end

  #可読性をあげるためにformat:以降をまとめた上も同じ
  with_options presence: true,format: {with: /\A[ァ-ヶー]+\z/, allow_blank: true} do
    validates :family_kana
    validates :kana
  end
    #今回はdeviseのカスタマイズのために英数字混合を記述している
 
  validates :password,    presence: true, format: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i, allow_blank: true 
  validates :nickname,    presence: true, length: { maximum: 6 }
  validates :date,        presence: true

  # Association
  #has_many :items今はコメントアウト！1008
  #has_many :orders今はコメントアウト！1008
end



#emailとencrypted_passwordに関しては、deviseの機能で入力時の制限がかかっている
#なので、それ以外は記述する必要がある