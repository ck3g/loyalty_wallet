class Vendor < ApplicationRecord
  belongs_to :user
  has_many :stamps, dependent: :destroy

  validates :user, :name, presence: true
end
