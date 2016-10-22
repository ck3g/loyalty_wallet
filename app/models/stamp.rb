class Stamp < ApplicationRecord
  PRIZE_STAMP_COUNT = 10

  belongs_to :user
  belongs_to :vendor

  validates :user, :vendor, presence: true

  delegate :name, to: :vendor, prefix: true

  scope :time_filter, -> (time_ago, use_filter) {
    where(created_at: time_ago..DateTime.current) if use_filter
  }

  def total_vendor_stamps(till_date: DateTime.current)
    vendor.total_stamps_count(user, till_date: till_date)
  end
end
