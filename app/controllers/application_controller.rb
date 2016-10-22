class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def current_vendor
    @current_vendor ||= current_user.vendor if current_user.is_a? VendorUser
  end
  helper_method :current_vendor

  protected

  def ensure_user_is_a_vendor
    redirect_to dashboard_path unless current_vendor
  end
end
