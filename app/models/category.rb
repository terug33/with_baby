class Category < ApplicationRecord

  #アソシエーション
  has_many :stores, dependent: :nullify

  #バリデーション
  validates :name, presence: true, uniqueness: true
end
