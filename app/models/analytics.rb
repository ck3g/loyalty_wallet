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
      .map { |stamp| { :date => stamp.date, :count => stamp.count } }
  end

  def current_cards
    Hash.new(0).tap do |total|
      vendor.stamps.group(:user_id)
        .select("COUNT(user_id) AS count")
        .map { |stamp| CurrentCountCalculator.new(stamp.count).calculate }
        .each { |count| total[count] += 1 }
    end
  end
end
