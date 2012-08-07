class Series < ActiveRecord::Base
  has_many :episodes
  mount_uploader :cover_image, ImageUploader
  accepts_nested_attributes_for :episodes
end
