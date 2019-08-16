class Post < ApplicationRecord
  belongs_to :user
  has_many :likes, dependent: :destroy 
  validates :name, presence: true
  validates :comment, presence: true, length: { maximum: 250 }
end
