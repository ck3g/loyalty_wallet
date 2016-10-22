class Vendor < ApplicationRecord
  belongs_to :user
  has_many :stamps, dependent: :destroy

  validates :user, :name, presence: true

  def total_stamps_count(user)
    stamps.where(user: user).count
  end
end
