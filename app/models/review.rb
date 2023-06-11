class Review < ApplicationRecord
  
  belongs_to :campsite
  belongs_to :member
  
  has_one_attached:review_image
  
end
