class Category < ApplicationRecord

  #アソシエーション
  has_many :stores, dependent: :nullify
end
