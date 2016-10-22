class UserDashboard
  attr_reader :user

  def initialize(user)
    @user = user
  end

  def user_code
    user.id
  end

  def qr_code
    RQRCode::QRCode.new(qr_code_uri, size: 4, level: :h)
  end

  def view_name
    "user_dashboard"
  end

  private

  def qr_code_uri
    # TODO: get rid of hardcoded stuff
    "http://loyaltywallet.2016.rubyrampage.com/users/#{user.id}/put-stamp"
  end
end
