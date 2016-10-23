class Deal < ApplicationRecord
  TITLE_LENGTH = 150
  belongs_to :vendor

  validates :vendor, presence: true
  validates :title, presence: true, length: { maximum: TITLE_LENGTH }
  validates :valid_from, :valid_till, presence: true
  validates :terms_of_service, acceptance: { message: "Please accept the Terms of Service" }
  validate :ensure_from_date_is_earlier_than_till_date, on: :create
  validate :ensure_there_is_no_deal_this_day, on: :create

  before_validation(on: :create) do
    if valid_from && valid_from_hour
      self.valid_from = valid_from.change(hour: valid_from_hour.to_i, min: 0, sec: 0)
    end
    if valid_till && valid_till_hour
      self.valid_till = valid_till.change(hour: valid_till_hour.to_i, min: 0, sec: 0)
    end
  end

  delegate :name, to: :vendor, prefix: true

  attr_accessor :valid_from_hour, :valid_till_hour

  scope :expired, -> { where("deals.valid_till < ?", DateTime.current).order(:valid_from) }
  scope :active, -> {
    where("deals.valid_from <= :date AND deals.valid_till > :date", date: DateTime.current)
  }
  scope :upcoming, -> { where("deals.valid_from > ?", DateTime.current).order(:valid_from) }

  def self.has_deal_this_day?(date)
    where("deals.valid_from <= :date AND deals.valid_till > :date", date: date).exists?
  end

  private

  def ensure_from_date_is_earlier_than_till_date
    if valid_from && valid_till && valid_from > valid_till
      errors.add(:valid_till, "Start time has to be before End time")
    end
  end

  def ensure_there_is_no_deal_this_day
    if valid_from && vendor.deals.has_deal_this_day?(valid_from)
      errors.add(:valid_from, "you have another deal during this time")
    end
    if valid_till && vendor.deals.has_deal_this_day?(valid_till)
      errors.add(:valid_till, "you have another deal during this time")
    end
  end
end
