class UserDashboard
  attr_reader :user

  def initialize(user)
    @user = user
  end

  def recent_activity
    @recent_activity ||= user.stamps.includes(:vendor).order(created_at: :desc).limit(100)
  end

  def user_code
    user.id
  end

  def qr_code
    RQRCode::QRCode.new(qr_code_uri, size: 10, level: :h)
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
