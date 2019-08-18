class Post < ApplicationRecord
  belongs_to :user
  has_many :likes, dependent: :destroy 
  validates :name, presence: true
  validates :comment, presence: true, length: { maximum: 250 }

  def self.search(search)
      return Post.all.group_by {|i| i.name} unless search
      Post.where(['name LIKE ?', "%#{search}%"]).group_by {|i| i.name}
  end
  
end