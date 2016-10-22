class VendorForm
  include Virtus.model
  include ActiveModel::Model

  attribute :name, String
  attribute :address, String
  attribute :email, String
  attribute :password, String
  attribute :password_confirmation, String

  validates :name, presence: true
  validates :email, presence: true, format: { with: Devise.email_regexp }
  validate :ensure_email_is_not_taken
  validates :password, presence: true, confirmation: true, length: { in: Devise.password_length }

  def persisted?
    false
  end

  def save
    return false if invalid?
    persist!
    true
  end

  def vendor_user
    @vendor_user
  end

  private

  def persist!
    ApplicationRecord.transaction do
      @vendor_user = User.new user_attributes
      @vendor_user.save!
      vendor = @vendor_user.build_vendor vendor_attributes
      vendor.save!
    end
  end

  def user_attributes
    attributes.slice(:email, :password, :password_confirmation).merge(type: "VendorUser")
  end

  def vendor_attributes
    attributes.slice(:name, :address)
  end

  def ensure_email_is_not_taken
    return unless email
    return unless User.where(email: email.downcase).exists?
    errors.add(:email, I18n.t("errors.messages.taken"))
  end
end
