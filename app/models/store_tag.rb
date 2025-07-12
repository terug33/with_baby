class StoreTag < ApplicationRecord

  #アソシエーション
  belongs_to :store
  belongs_to :tag

  #バリデーション
  validates :store_id, uniqueness: {scope: :tag_id}
end
