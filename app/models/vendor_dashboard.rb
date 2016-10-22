class VendorDashboard
  def initialize(vendor_user)
    @vendor_user = vendor_user
  end

  def recent_activity
    @recent_activity = vendor.stamps.includes(:user).order(created_at: :desc).limit(100)
  end

  def users_per_day
    @users_per_day ||= vendor.stamps
      .where(created_at: 10.days.ago..DateTime.current)
      .order("DATE(created_at)")
      .group("DATE(created_at)")
      .select("COUNT(stamps.id) as count, DATE(created_at) AS date")
      .map { |stamp| { stamp.date => stamp.count } }
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
