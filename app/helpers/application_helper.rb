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
end
