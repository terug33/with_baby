class Tag < ApplicationRecord

  #多対多のアソシエーション
  has_many :store_tags  #中間テーブルへの直接の関連
  has_many :stores, through: :store_tags  #Storeとの間接的な関連

  #バリデーション（Tagモデルには別でUNIQUEの制約もかけた）
  validates :name, presence: true, uniqueness: true
end
