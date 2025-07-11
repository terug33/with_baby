class Tag < ApplicationRecord

  #アソシエーション
  has_many :stores, through: :store_tags

  #バリデーション（Tagモデルには別でUNIQUEの制約もかけた）
  validates :name, presence: true, uniqueness: true
end
