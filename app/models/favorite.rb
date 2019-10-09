class Favorite < ApplicationRecord
  belongs_to :user
  validates :name, presence: true
  validates :memo, presence: true
  validate :memo_length
  
  def memo_length
    memo_for_validation = memo.gsub(/\r\n/,"").gsub(/r/,"").gsub(/\s/,"")
    if memo_for_validation.length > 250
      errors.add(:memo, "は250文字以内で入力してください")
    end
  end
end
