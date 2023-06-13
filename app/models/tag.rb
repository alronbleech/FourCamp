class Tag < ApplicationRecord

  has_many :tagmaps, dependent: :destroy
  has_many :reviews, through: :tagmaps, dependent: :destroy

end
