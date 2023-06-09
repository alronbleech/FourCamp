class Review < ApplicationRecord

  belongs_to :campsite
  belongs_to :member
  belongs_to :season

  has_many :tagmaps, dependent: :destroy
  has_many :tags, through: :tagmaps

  #accepts_nested_attributes_for :tagmaps

  has_one_attached:review_image

  validates :title, presence: true, length: { maximum: 30 }
  validates :star, presence: true
  validates :comment, presence: true, length: { maximum: 200 }
  validates :season_id, presence: true

  def save_tags(savereview_tags)
    current_tags = self.tags.pluck(:name) unless self.tags.nil?
    old_tags = current_tags - savereview_tags
    new_tags = savereview_tags - current_tags

    old_tags.each do |old_name|
      self.tags.delete Tag.find_by(name:old_name)
    end

    new_tags.each do |new_name|
      tagmap = Tag.find_or_create_by(name:new_name)
      self.tags << tagmap
    end
  end

end
