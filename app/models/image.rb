class Image < ActiveRecord::Base
  has_many :comments, dependent: :destroy

  validates :name, length: { maximum: 108 }
  validates :name, presence: true
  validates :description, length: { maximum: 500 }

  mount_uploader :file, ImageUploader
end
