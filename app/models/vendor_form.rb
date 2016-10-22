class VendorForm
  include Virtus.model
  include ActiveModel::Model

  attribute :email, String
  attribute :password, String
  attribute :password_confirmation, String

  validates :email, presence: true, format: { with: Devise.email_regexp }
  validate :ensure_email_is_unuq
  validates :password, presence: true, confirmation: true, length: { in: Devise.password_length }

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
    @vendor_user = User.new user_attributes
    @vendor_user.save!
  end

  def user_attributes
    attributes.slice(:email, :password, :password_confirmation).merge(type: "VendorUser")
  end

  def ensure_email_is_unuq
    return unless email
    return unless User.where(email: email.downcase).exists?
    errors.add(:email, I18n.t("errors.messages.taken"))
  end
end
