class Campsite < ApplicationRecord

  belongs_to :campsite_type
  belongs_to :prefecture
  has_many :reviews, dependent: :destroy

  has_one_attached :campsite_image
  has_one_attached :map_image
  has_one_attached :temperture_image

  validates :name, presence: true, length: {minimum: 5}
  validates :campsite_type_id, presence: true
  validates :prefecture_id, presence: true
  validates :address, presence: true
  validates :phone_number, presence: true, length: {minimum: 7}, numericality: { only_integer: true }
  validates :route, presence: true, length: {minimum: 10}
  validates :feature, presence: true, length: {minimum: 10}
  validates :considerations, presence: true, length: {minimum: 10}

  #地図機能実装時有効化
  #validates :latitude, presence: true
  #validates :longitude, presence: true

end
