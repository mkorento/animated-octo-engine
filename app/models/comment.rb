class Comment < ActiveRecord::Base
  belongs_to :image
  validates :nickname, length: { maximum: 15 }
  validates :nickname, presence: true
  validates :content, length: { maximum: 140 }
  validates :content, presence: true
end
