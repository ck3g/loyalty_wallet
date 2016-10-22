class AnalyticsController < ApplicationController
  before_action :authenticate_user!
  before_action :ensure_user_is_a_vendor

  def show
    @analytics = Analytics.new(current_vendor, params[:since])
  end

  private

  def ensure_user_is_a_vendor
    redirect_to dashboard_path unless current_vendor
  end
end
