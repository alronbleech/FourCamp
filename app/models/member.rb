class Member < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :reviews, dependent: :destroy
  has_many :contacts, dependent: :destroy

  has_one_attached:profile_image

  validates :name, presence: true
  validates :name_ruby, presence: true
  validates :nickname, presence: true

  def active_for_authentication?
    super && (is_deleted == false)
  end

  def boolean_label(value)
    value ? '退会' : '有効'
  end

end
