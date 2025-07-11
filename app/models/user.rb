class User < ApplicationRecord
#アソシエーション
  has_many :stores, dependent: :destroy
  has_many :comments, dependent: :destroy


#devise機能
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable


#バリデーション
  validates :name, presence: true
end
