class Contact < ApplicationRecord

  belongs_to :member
  
  enum supported_status: {
    unsupported: 0,
    fixed: 1,
  }
  
end
