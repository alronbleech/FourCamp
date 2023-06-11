class Campsite < ApplicationRecord

  belongs_to :campsite_type
  belongs_to :prefecture
  has_many :reviews, dependent: :destroy

  has_one_attached :campsite_image
  has_one_attached :map_image
  has_one_attached :temperture_image

  validates :campsite_image, presence: true
  validates :name, presence: true
  validates :campsite_type_id, presence: true
  validates :prefecture_id, presence: true
  validates :address, presence: true
  validates :phone_number, presence: true
  validates :route, presence: true
  validates :feature, presence: true
  validates :considerations, presence: true

  #地図機能実装時有効化
  #validates :latitude, presence: true
  #validates :longitude, presence: true

end
