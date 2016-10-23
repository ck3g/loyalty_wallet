require 'rails_helper'

feature 'View active deal' do
  given!(:deal) { create :deal }

  scenario "can see active deal" do
    sign_in_as deal.vendor.user.email

    within ".dashboard__nav" do
      click_link "Deals"
    end

    expect(current_path).to eq deal_path(deal)
    expect(page).to have_content deal.title
  end
end
