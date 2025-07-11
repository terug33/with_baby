class Store < ApplicationRecord

#アソシエーション
  belongs_to :user 
  belongs_to :category



#バリデーション
  validates :name, presence: true
  validates :description, presence: true 
  validates :score, presence: true
end
