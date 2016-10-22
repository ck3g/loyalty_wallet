class AnalyticsController < ApplicationController
  before_action :authenticate_user!
  before_action :ensure_user_is_a_vendor

  def show
    @analytics = Analytics.new(current_vendor, params[:since])
  end
end
