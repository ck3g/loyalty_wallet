class Stamp < ApplicationRecord
  PRIZE_STAMP_COUNT = 10

  belongs_to :user
  belongs_to :vendor

  validates :user, :vendor, presence: true

  delegate :name, to: :vendor, prefix: true
  delegate :email, to: :user, prefix: true

  def vendor_stamps
    vendor.stamps.where(user: user).count % PRIZE_STAMP_COUNT
  end
end
