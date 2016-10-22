class Stamp < ApplicationRecord
  PRIZE_STAMP_COUNT = 10

  belongs_to :user
  belongs_to :vendor

  validates :user, :vendor, presence: true

  delegate :name, to: :vendor, prefix: true

  def total_vendor_stamps
    vendor.total_stamps_count(user)
  end
end
