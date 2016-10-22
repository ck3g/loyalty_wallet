class VendorsController < ApplicationController
  before_action :authenticate_user!
  before_action :ensure_user_is_a_vendor

  def edit
  end

  def update
    if current_vendor.update_attributes vendor_attrs
      redirect_to dashboard_path, notice: "Vendor's settings has been changed"
    else
      render :new
    end
  end

  private

  def vendor_attrs
    params.require(:vendor).permit(:name, :address)
  end
end
