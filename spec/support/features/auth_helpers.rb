module Features
  module AuthHelpers
    def sign_in_as(email, password = "password")
      visit new_user_session_path

      fill_in_login_data_as email, password
    end

    def fill_in_login_data_as(email, password = "password")
      within "#new_user" do
        fill_in "user_email", with: email
        fill_in "user_password", with: password
        click_button "Log in"
      end
    end
  end
end
