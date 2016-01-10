class Image < ActiveRecord::Base
  has_many :comments, dependent: :destroy

  mount_uploader :file, ImageUploader
end
