require 'rails_helper'

feature "Vendor Sign Up" do
  scenario "can sign up with valid credentials" do
    visit new_user_registration_path(type: "Vendor")

    within "#new_vendor_form" do
      fill_in :vendor_form_name, with: "Cozy Coffee Place"
      fill_in :vendor_form_address, with: "Leopold Platz 221b, 12345, Berlin"
      fill_in :vendor_form_email, with: "vendor@example.com"
      fill_in :vendor_form_password, with: "password"
      fill_in :vendor_form_password_confirmation, with: "password"
      click_button "Create account"
    end

    expect(page).to have_content "Welcome! You have signed up successfully"
    expect(VendorUser.last.vendor).to be_present
  end

  scenario "see validation errors with invalid credentials" do
    visit new_user_registration_path(type: "Vendor")

    within "#new_vendor_form" do
      click_button "Create account"
    end

    expect(page).to have_content "can't be blank"
    expect(page).to have_content "6 characters minimum"
  end
end
