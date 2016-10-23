class Deal < ApplicationRecord
  TITLE_LENGTH = 150
  belongs_to :vendor

  validates :vendor, presence: true
  validates :title, presence: true, length: { maximum: TITLE_LENGTH }
  validates :valid_till, presence: true
  validates :terms_of_service, acceptance: true

  before_validation(on: :create) do
    if valid_till && valid_till_hour
      self.valid_till = valid_till.change(hour: valid_till_hour.to_i, min: 0, sec: 0)
    end
  end

  delegate :name, to: :vendor, prefix: true

  attr_accessor :valid_till_hour

  scope :active, -> { where("deals.valid_till > ?", DateTime.current) }
end
