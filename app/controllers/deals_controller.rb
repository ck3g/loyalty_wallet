class DealsController < VendorApplicationController
  def new
    @deal = current_vendor.deals.new
  end

  def create
    @deal = current_vendor.deals.new deal_params
    if @deal.save
      redirect_to dashboard_path, notice: "The Deal has been started"
    else
      render :new
    end
  end

  private

  def deal_params
    params.require(:deal).permit(:title, :valid_till_day, :valid_till_hour, :terms_of_service)
  end
end
