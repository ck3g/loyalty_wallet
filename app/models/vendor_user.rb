class VendorUser < User
  has_one :vendor, dependent: :destroy, foreign_key: :user_id
end
