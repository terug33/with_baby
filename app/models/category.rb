class Category < ApplicationRecord

  #アソシエーション
  has_many :stores 
end
