class VendorDashboard
  def initialize(vendor_user)
    @vendor_user = vendor_user
  end

  def recent_activity
    @recent_activity = vendor.stamps.includes(:user).order(created_at: :desc).limit(100)
  end

  def vendor_name
    vendor.name
  end

  def view_name
    "vendor_dashboard"
  end

  private

  attr_reader :vendor_user

  def vendor
    vendor_user.vendor
  end
end
