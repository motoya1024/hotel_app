class Post < ApplicationRecord
  belongs_to :user
  validates :name, presence: true
  validates :comment, presence: true, length: { maximum: 250 }
end
