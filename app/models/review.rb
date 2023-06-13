class Review < ApplicationRecord
  
  belongs_to :campsite
  belongs_to :member
  
  has_many :tagmaps, dependent: :destroy
  has_many :tags, through: :tagmaps, dependent: :destroy
  
  has_one_attached:review_image
  
end
