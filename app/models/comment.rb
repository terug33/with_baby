class Comment < ApplicationRecord

  #アソシエーション
  belongs_to :user
  belongs_to :store

  validates :content, presence: true 
end
