class Tag < ApplicationRecord

  has_many :tagmaps, dependent: :destroy
  has_many :reviews, through: :tagmaps

  validates :name, presence: true

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

    review_ids = []
    tags.each do |tag|
      review_ids = review_ids + tag.reviews.ids
    end

    return review_ids.uniq

    # tags.inject(init = []) {|result, tag| result + tag.reviews}

  end
end
