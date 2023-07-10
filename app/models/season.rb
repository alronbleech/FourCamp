class Season < ApplicationRecord
  
  has_many :reviews, dependent: :destroy

  enum season_name:{
    "---":0,
    春:1,夏:2,秋:3,冬:4
  }
  
end
