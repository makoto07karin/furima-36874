class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  #validatesの設定をするが確か
  validates :nickname,    presence: true
  validates :family_name, presence: true
  validates :name,        presence: true
  validates :family_kana, presence: true
  validates :kana,        presence: true
  validates :date,        presence: true

  # Association
  has_many :items
  has_many :orders
end
