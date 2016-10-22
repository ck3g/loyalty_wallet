class Analytics
  attr_reader :vendor

  def initialize(vendor, since = nil)
    @vendor = vendor
    @since = since
  end

  def users_per_day
    @users_per_day ||= vendor.stamps
      .time_filter(time_ago, time_filter?)
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

  private

  attr_reader :since

  def time_ago
    {
      '2weeks' => 1.weeks.ago,
      'month' => 1.month.ago,
      '3monts' => 3.months.ago
    }.fetch(since, 1.week.ago)
  end

  def time_filter?
    since == 'ever'
  end
end
