class StoreTag < ApplicationRecord

  #アソシエーション
  belongs_to :store
  belongs_to :tag

  #バリデーション
  
end
