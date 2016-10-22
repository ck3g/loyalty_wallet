class StampsController < ApplicationController
  before_action :authenticate_user!
  before_action :ensure_current_user_is_a_vendor_user

  def new
    @stamp = current_vendor.stamps.new
  end

  def create
    @stamp = current_vendor.stamps.new stamps_params
    if @stamp.save
      redirect_to dashboard_path, notice: "You've just put the stamp for user with ID: #{@stamp.user_id}"
    else
      render :new
    end
  end

  private

  def ensure_current_user_is_a_vendor_user
    return if current_vendor
    redirect_to dashboard_path
  end

  def stamps_params
    params.require(:stamp).permit(:user_id)
  end
end
