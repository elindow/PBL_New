class Question < ActiveRecord::Base
  
  has_and_belongs_to_many :topics
  
  mount_uploader :qimage, QimageUploader
end
