class VendorApplicationController < ApplicationController
  before_action :authenticate_user!
  before_action :ensure_user_is_a_vendor

  protected

  def ensure_user_is_a_vendor
    redirect_to dashboard_path unless current_vendor
  end
end
