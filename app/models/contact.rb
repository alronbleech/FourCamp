class Contact < ApplicationRecord

  belongs_to :member

  enum supported_status: {
    unsupported: 0,
    fixed: 1,
  }

  validates :subject, presence: true, length: {maximum: 20}
  validates :demand, presence: true, length: {maximum: 200}

end
