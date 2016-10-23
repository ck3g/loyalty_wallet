class Deal < ApplicationRecord
  TITLE_LENGTH = 150
  belongs_to :vendor

  validates :vendor, presence: true
  validates :title, presence: true, length: { maximum: TITLE_LENGTH }
  validates :valid_from, :valid_till, presence: true
  validates :terms_of_service, acceptance: true
  validate :ensure_from_date_is_earlier_than_till_date

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

  scope :active, -> { where("deals.valid_till > ?", DateTime.current) }

  private

  def ensure_from_date_is_earlier_than_till_date
    if valid_from && valid_till && valid_from > valid_till
      errors.add(:valid_till, "cannot be earlier than Start Date")
    end
  end
end
