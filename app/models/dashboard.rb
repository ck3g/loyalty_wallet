class Dashboard
  attr_reader :user

  def initialize(user)
    @user = user
  end

  def user_code
    user.id
  end

  def qr_code
    RQRCode::QRCode.new('Made in Wedding', size: 4, level: :h)
  end
end
