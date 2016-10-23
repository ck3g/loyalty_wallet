class DealsController < VendorApplicationController
  before_action :preload_deals

  def new
    @deal = current_vendor.deals.new
  end

  def create
    @deal = current_vendor.deals.new deal_params
    if @deal.save
      redirect_to new_deal_path, notice: "The Deal has been started"
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

  def preload_deals
    @expired_deals = current_vendor.deals.expired
    @active_deals = current_vendor.deals.active
    @upcoming_deals = current_vendor.deals.upcoming
  end
end
