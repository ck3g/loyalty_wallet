class Stamp < ApplicationRecord
  belongs_to :user
  belongs_to :vendor

  validates :user, :vendor, presence: true

  delegate :name, to: :vendor, prefix: true
  delegate :email, to: :user, prefix: true
end
