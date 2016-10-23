class Vendor < ApplicationRecord
  belongs_to :user
  has_many :stamps, dependent: :destroy
  has_many :deals, dependent: :destroy

  validates :user, :name, presence: true

  def total_stamps_count(user, till_date: DateTime.current)
    stamps.where(user: user).where("stamps.created_at <= ?", till_date).count
  end
end
