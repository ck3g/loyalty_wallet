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
    (1..7).to_a.map { |day| [pluralize(day, "Day"), day] }
  end

  def deal_hours_collection
    (0..23).to_a
  end
end
