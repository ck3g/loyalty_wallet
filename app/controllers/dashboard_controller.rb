class DashboardController < ApplicationController
  before_action :authenticate_user!

  def show
    @dashboard = Dashboard.for_user(current_user)
    render @dashboard.view_name
  end
end
