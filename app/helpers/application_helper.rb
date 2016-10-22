module ApplicationHelper
  def current_stamps_count(total_count)
    "#{total_count % Stamp::PRIZE_STAMP_COUNT} / #{Stamp::PRIZE_STAMP_COUNT}"
  end
end
