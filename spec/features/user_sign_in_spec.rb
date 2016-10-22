require 'rails_helper'

feature 'Sign in user' do
  scenario 'can sign in with valid credentials' do
    create :user_example_com

    sign_in_as "user@example.com", "password"

    expect(page).to have_content "Signed in successfully"
  end
end
