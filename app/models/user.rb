class User < ApplicationRecord
 
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  with_options presence: true, format: {with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, allow_blank: true} do
    validates :family_name
    validates :name
  end

  
  with_options presence: true,format: {with: /\A[ァ-ヶー]+\z/, allow_blank: true} do
    validates :family_kana
    validates :kana
  end
 
  validates :password,    presence: true, format: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i, allow_blank: true 
  validates :nickname,    presence: true, length: { maximum: 6 }
  validates :date,        presence: true

  # Association
  has_many :items
  #has_many :orders今はコメントアウト！1008
end


