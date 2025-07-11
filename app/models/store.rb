class Store < ApplicationRecord

#アソシエーション
  belongs_to :user 
  belongs_to :category
  has_many :comments, dependent: :destroy
  # has_many :store_tags, dependent: :destroy
  has_many :tags, through: :store_tags



#バリデーション
  validates :name, presence: true
  validates :description, presence: true 
  validates :score, presence: true, numericality: { only_integer: true, in: 1..5 }
end
