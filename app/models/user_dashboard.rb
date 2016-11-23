class UserDashboard
  attr_reader :user

  def initialize(user)
    @user = user
  end

  def recent_activity
    @recent_activity ||= user.stamps.includes(:vendor).order(created_at: :desc).limit(100)
  end

  def my_cards
    @my_cards = Vendor.where(id: user.stamps.pluck(:vendor_id).uniq).order(:name)
  end

  def user_code
    user.id
  end

  def qr_code
    RQRCode::QRCode.new(qr_code_uri, size: 10, level: :h)
  end

  def active_deals
    Deal.active.where(vendor_id: visited_vendors_ids).order(:valid_till)
  end

  def view_name
    "user_dashboard"
  end

  private

  def qr_code_uri
    # TODO: get rid of hardcoded stuff
    "https://loyalty-wallet.herokuapp.com/users/#{user.id}/put-stamp"
  end

  def visited_vendors_ids
    @visited_vendors_ids ||= user.stamps.pluck(:vendor_id).uniq
  end
end
