class User < ApplicationRecord
#アソシエーション
  has_many :stores


#devise機能
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable


#バリデーション
  validates :name, presence: true
end
