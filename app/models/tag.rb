class Tag < ApplicationRecord

  has_many :tagmaps, dependent: :destroy
  has_many :reviews, through: :tagmaps

  validates :tag_name, presence: true

  scope :merge_reviews, -> (tags){ }

  def self.search_reviews_for(content, method)

    if method == 'perfect'
      tags = Tag.where(name: content)
    elsif method == 'forward'
      tags = Tag.where('name LIKE ?', content + '%')
    elsif method == 'backward'
      tags = Tag.where('name LIKE ?', '%' + content)
    else
      tags = Tag.where('name LIKE ?', '%' + content + '%')
    end

    return tags.inject(init = []) {|result, tag| result + tag.reviews}

  end
end
