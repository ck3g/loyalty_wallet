require 'rails_helper'

feature "Create Deal" do
  given!(:vendor) { create :vendor }

  scenario "vendor can roll out single deal" do
    sign_in_as vendor.user.email

    within 'ul.dashboard__nav' do
      click_link "Deals"
    end

    within "#new_deal" do
      fill_in "deal_title", with: "Pierogi und Salad dazu"
      select "Today", from: "deal_valid_from"
      select "12:00", from: "deal_valid_from_hour"
      select "Today", from: "deal_valid_till"
      select "15:00", from: "deal_valid_till_hour"
      check "deal_terms_of_service"
      click_button "Start Deal"
    end

    expect(page).to have_content "The Deal has been started"
    expect(vendor.deals.count).to eq 1
  end
end
