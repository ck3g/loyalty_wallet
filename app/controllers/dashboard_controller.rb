class DashboardController < ApplicationController
  before_action :authenticate_user!
  before_action :ensure_user_is_a_vendor, only: [:analytics]

  def show
    @dashboard = Dashboard.for_user(current_user)
    render @dashboard.view_name
  end
end
