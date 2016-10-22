require 'rails_helper'

feature 'Put Stamp manually' do
  given!(:user) { create :user }
  given!(:vendor) { create :vendor }
  given(:vendor_user) { vendor.user }

  scenario "Can put stamp manually by knowing user's ID" do
    sign_in_as vendor_user.email
    click_link "Put Stamp"

    within "#new_stamp" do
      fill_in :stamp_user_id, with: user.id
      click_button "Put it"
    end

    expect(page).to have_content "You've just put the stamp for user with ID: #{user.id}"
    expect(user.stamps.count).to eq 1
    expect(vendor.stamps.count).to eq 1
  end
end
