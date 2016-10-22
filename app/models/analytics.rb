class Analytics
  attr_reader :vendor

  def initialize(vendor)
    @vendor = vendor
  end

  def users_per_day
    @users_per_day ||= vendor.stamps
      .where(created_at: 10.days.ago..DateTime.current)
      .order("DATE(created_at)")
      .group("DATE(created_at)")
      .select("COUNT(stamps.id) as count, DATE(created_at) AS date")
      .map { |stamp| { stamp.date => stamp.count } }
  end
end
