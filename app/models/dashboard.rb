class Dashboard
  def self.for_user(user)
    klass = user.is_a?(VendorUser) ? VendorDashboard : UserDashboard
    klass.new(user)
  end
end
