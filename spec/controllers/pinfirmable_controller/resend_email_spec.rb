require "spec_helper"

RSpec.describe Devise::PinfirmableController do
  describe "POST resend_email" do
    before do
      @request.env["devise.mapping"] = Devise.mappings[:user]
      @user = User.create(email: "test@example.com", password: "password")
      sign_in @user
    end

    it "redirects back to the confirm page" do
      post :resend_email
      expect(response).to be_redirect
    end

    it "sets the flash" do
      post :resend_email
      expect(flash[:notice]).to eq(I18n.t("pinfirmable.resend_email.notice_html",
                                          email: "test@example.com",
                                          not_correct_link: "<a rel=\"nofollow\" data-method=\"delete\" href=\"/users/sign_out\">Not the right email?</a>"))
    end
  end
end
