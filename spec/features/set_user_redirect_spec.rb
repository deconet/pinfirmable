require "spec_helper"

RSpec.feature "Set User redirect" do
  scenario "redirects authenticated users to the pin confirmation page" do
    visit new_user_registration_path
    email = "abcd@example.com"
    fill_in "user_email", with: email
    fill_in "user_password", with: "password"
    fill_in "user_password_confirmation", with: "password"
    click_button "Sign up"
    expect(page.current_path).to eq "/users/pinfirmable/new"
  end
end
