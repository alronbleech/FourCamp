class CampsiteType < ApplicationRecord

  has_many :campsites, dependent: :destroy

  enum type_name:{
    "---":0,
    高原:1,海辺:2,河原:3,林間:4,湖畔:5
  }

end
