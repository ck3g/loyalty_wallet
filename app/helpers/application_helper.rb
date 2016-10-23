module ApplicationHelper
  def link_to_nav(title, path)
    active_class = "active" if current_page? path
    content_tag :li, class: active_class do
      link_to title, path, class: "page-scroll"
    end
  end

  def current_stamps_count(total_count)
    CurrentCountCalculator.new(total_count).calculate
  end

  def deal_days_collection
    (0...7).to_a.map do |day|
      if day.zero?
        ["Today", Date.current]
      else
        date = day.days.from_now.to_date
        [date.to_s(:short), date]
      end
    end
  end

  def deal_hours_collection
    (0..23).to_a.map { |hour| [time_format(hour), hour] }
  end

  def time_format(hour)
    "#{"%02d" % hour}:00"
  end

  def deal_valid_time(deal)
    [
      deal.valid_from.to_s(:short),
      deal.valid_till.to_s(:short)
    ].join(" - ")
  end
end
