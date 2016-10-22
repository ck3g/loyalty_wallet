require 'rails_helper'

feature 'User Dashboard' do
  scenario 'can see his Dashboard' do
    user = create :user_example_com

    sign_in_as "user@example.com"

    expect(page).to have_content "Your ID: #{user.id}"
  end
end

