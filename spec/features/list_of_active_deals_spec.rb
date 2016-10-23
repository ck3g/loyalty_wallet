require 'rails_helper'

feature "List of active deals" do
  given!(:user) { create :user_example_com }

  context "when there is no active deals yet" do
    scenario "user sees no deals message" do
      sign_in_as "user@example.com"

      within "#deals" do
        expect(page).to have_content "There are no active deals for you yet."
      end
    end
  end

  context "when there is active deal" do
    given!(:deal) { create :deal }

    context "when user did not visit the vendor yet" do
      scenario "user sees no deals message" do
        sign_in_as "user@example.com"

        within "#deals" do
          expect(page).to have_content "There are no active deals for you yet."
        end
      end
    end

    context "when user visited the vendor alread" do
      background do
        create :stamp, user: user, vendor: deal.vendor
      end

      scenario "user sees the deal" do
        sign_in_as "user@example.com"

        within "#deals" do
          expect(page).not_to have_content "There are no active deals for you yet."
          expect(page).to have_content deal.title
          expect(page).to have_content deal.vendor_name
        end
      end
    end
  end
end
