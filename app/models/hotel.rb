class Hotel < ApplicationRecord
  belongs_to :user
  
  validates :comment, presence: true, length: { maximum: 250 }

end
