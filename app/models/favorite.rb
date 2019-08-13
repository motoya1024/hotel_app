class Favorite < ApplicationRecord
  belongs_to :user
  validates :name, presence: true
  validates :memo, presence: true, length: { maximum: 250 }
end
