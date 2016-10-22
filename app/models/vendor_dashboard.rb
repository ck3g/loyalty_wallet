class VendorDashboard
  def initialize(vendor_user)
    @vendor_user = vendor_user
  end

  def vendor_name
    vendor_user.vendor.name
  end

  def view_name
    "vendor_dashboard"
  end

  private

  attr_reader :vendor_user
end
