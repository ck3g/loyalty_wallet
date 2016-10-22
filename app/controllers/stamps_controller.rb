class StampsController < ApplicationController
  before_action :authenticate_user!
  before_action :ensure_current_user_is_a_vendor_user

  def new
    @stamp = current_vendor.stamps.new
  end

  def create
    params[:user_id] ? create_from_link : create_from_form
  end

  private

  def create_from_link
    if user = User.find_by(id: params[:user_id])
      stamp = current_vendor.stamps.create user: user
      redirect_to dashboard_path, notice: t("stamps.successfully_created", user_id: stamp.user_id)
    else
      redirect_to dashboard_path, alert: t("stamp.failure")
    end
  end

  def create_from_form
    @stamp = current_vendor.stamps.new stamps_params
    if @stamp.save
      redirect_to dashboard_path, notice: t("stamps.successfully_created", user_id: @stamp.user_id)
    else
      render :new
    end
  end

  def ensure_current_user_is_a_vendor_user
    return if current_vendor
    redirect_to dashboard_path
  end

  def stamps_params
    params.require(:stamp).permit(:user_id)
  end

end
