class Episode < ActiveRecord::Base
  
  has_many :tracks
  mount_uploader :cover_image, ImageUploader
  accepts_nested_attributes_for :tracks

end
