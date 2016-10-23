require 'rails_helper'

feature "List of active deals" do
  given!(:user) { create :user_example_com }

  background do
    sign_in_as "user@example.com"
  end

  context "when there is no active deals yet" do
    scenario "user sees no deals message" do
      within ".dashboard__nav" do
        click_link "Deals"
      end

      expect(current_path).to eq deals_path
      expect(page).to have_content "There is no active deals for you yet."
    end
  end
end
