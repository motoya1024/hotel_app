class Post < ApplicationRecord
  belongs_to :user
  has_many :likes, dependent: :destroy 
  validates :name, presence: true
  validates :comment, presence: true
  validate :comment_length

  def self.search(search)
    return Post.all.group_by {|i| i.name} unless search
    Post.where(['name LIKE ?', "%#{search}%"]).group_by {|i| i.name}
  end
  
  def comment_length
    comment_for_validation = comment.gsub(/\r\n/,"").gsub(/r/,"").gsub(/\s/,"")
    if comment_for_validation.length > 250
      errors.add(:comment, "は250文字以内で入力してください")
    end
  end
end