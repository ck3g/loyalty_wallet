class AnalyticsController < VendorApplicationController
  def show
    @analytics = Analytics.new(current_vendor, params[:since])
  end
end
