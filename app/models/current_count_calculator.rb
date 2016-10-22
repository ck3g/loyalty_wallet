class CurrentCountCalculator

  def initialize(total_count)
    @total_count = total_count
  end

  def calculate
    return 0 if total_count.zero?
    return max if total_count % max == 0

    total_count % max
  end

  private

  attr_reader :total_count

  def max
    Stamp::PRIZE_STAMP_COUNT
  end
end
