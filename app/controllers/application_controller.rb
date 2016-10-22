class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def current_vendor
    @current_vendor ||= current_user.vendor if current_user.is_a? VendorUser
  end
  helper_method :current_vendor
end
