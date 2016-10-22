class Stamp < ApplicationRecord
  belongs_to :user
  belongs_to :vendor

  validates :user, :vendor, presence: true
end
