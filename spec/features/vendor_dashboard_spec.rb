require 'rails_helper'

feature 'User Dashboard' do
  scenario 'can see his Dashboard' do
    vendor = create :vendor

    sign_in_as vendor.user.email

    expect(page).to have_content "Vendor: #{vendor.name}"
  end
end

