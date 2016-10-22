class RegistrationsController < Devise::RegistrationsController
  layout :registration_layout

  def new
    if params[:type].to_s.capitalize == "Vendor"
      @vendor_form = VendorForm.new
    else
      super
    end
  end

  def create
    if params[:vendor_form]
      @vendor_form = VendorForm.new vendor_form_params
      if @vendor_form.save
        set_flash_message! :notice, :signed_up
        sign_up(:user, @vendor_form.vendor_user)
        respond_with resource, location: after_sign_up_path_for(@vendor_form.vendor_user)
      else
        clean_up_passwords @vendor_form
        set_minimum_password_length
        render :new
      end
    else
      super
    end
  end

  private

  def vendor_form_params
    params.require(:vendor_form).permit(:name, :address, :email, :password, :password_confirmation)
  end

  def registration_layout
    %w(edit update).include?(action_name) ? "application" : "welcome"
  end
end
