class StampsController < ApplicationController
  # TODO: replace with cancan
  before_action :authenticate_user!

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

  def stamps_params
    params.require(:stamp).permit(:user_id)
  end
end
