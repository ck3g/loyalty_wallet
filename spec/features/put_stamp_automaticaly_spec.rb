require 'rails_helper'

feature 'Put Stamp automaticaly' do
  given!(:user) { create :user }
  given!(:vendor) { create :vendor }
  given(:vendor_user) { vendor.user }

  scenario "via visiting scanned url" do
    visit "/users/#{user.id}/put-stamp"

    fill_in_login_data_as vendor_user.email

    expect(current_path).to eq dashboard_path
    expect(page).to have_content "You've just put the stamp for user with ID: #{user.id}"
    expect(user.stamps.count).to eq 1
    expect(vendor.stamps.count).to eq 1
  end
end
