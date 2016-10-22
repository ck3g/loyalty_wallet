require 'rails_helper'

feature 'Update Vendor settings' do
  given!(:vendor_user) { create :vendor_example_com }
  given!(:vendor) { create :vendor, user: vendor_user }

  scenario "vendor user can update vendor settings" do
    sign_in_as "vendor@example.com"
    visit edit_vendor_path

    within "#edit_vendor_#{vendor.id}" do
      fill_in :vendor_name, with: "Pierogi"
      fill_in :vendor_address, with: "Somewhere at Rosenthaler Platz"
      click_button "Update"
    end

    expect(page).to have_content "Vendor's settings has been changed"
    expect(vendor.reload.name).to eq "Pierogi"
    expect(vendor.reload.address).to eq "Somewhere at Rosenthaler Platz"
  end
end
