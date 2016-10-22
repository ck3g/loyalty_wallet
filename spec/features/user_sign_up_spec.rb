require 'rails_helper'

feature "Sign up as regular user" do
  scenario "can sign up with valid credentials" do
    visit new_user_registration_path

    within "#new_user" do
      fill_in :user_email, with: "user@example.com"
      fill_in :user_password, with: "password"
      fill_in :user_password_confirmation, with: "password"
      click_button "Sign up"
    end

    expect(page).to have_content "A message with a confirmation link has been sent to your email address"
  end
end
