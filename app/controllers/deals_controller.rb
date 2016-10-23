class DealsController < VendorApplicationController
  before_action :redirect_to_active_deal, only: [:new, :create]

  def show
    @deal = current_vendor.active_deal
  end

  def new
    @deal = current_vendor.deals.new
  end

  def create
    @deal = current_vendor.deals.new deal_params
    if @deal.save
      redirect_to dashboard_path, notice: "The Deal has been started"
    else
      @deal.valid_till_hour = @deal.valid_till.hour
      render :new
    end
  end

  private

  def deal_params
    params.require(:deal).permit(
      :title, :valid_from, :valid_from_hour, :valid_till, :valid_till_hour, :terms_of_service
    )
  end

  def redirect_to_active_deal
    return unless current_vendor.active_deal
    redirect_to deal_path(current_vendor.active_deal)
  end
end
