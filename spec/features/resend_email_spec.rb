require "spec_helper"

RSpec.feature "User signup" do
  before do
    ActionMailer::Base.deliveries = []
    sign_up_user
    click_button "Not received an email?"
  end

  scenario "sends an email with the pin" do
    expect(ActionMailer::Base.deliveries.count).to eq(2)
  end

  def sign_up_user
    visit new_user_registration_path
    fill_in "user_email", with: "test@example.com"
    fill_in "user_password", with: "password"
    fill_in "user_password_confirmation", with: "password"
    click_button "Sign up"
  end
end
