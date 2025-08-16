class Store < ApplicationRecord

#アソシエーション
  belongs_to :user 
  belongs_to :category
  has_many :comments, dependent: :destroy
  has_many_attached :images 
  has_many :store_tags, dependent: :destroy  #中間テーブルとの直接の関連
  has_many :tags, through: :store_tags  #Tagとの間接的な関連
  



#バリデーション
  validates :name, presence: true
  validates :description, presence: true 
  validates :score, presence: true, numericality: { only_integer: true, in: 1..5 }


#地図機能
  geocoded_by :address
  after_validation :geocode 
end
