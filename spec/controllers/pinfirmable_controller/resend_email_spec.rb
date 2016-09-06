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
      expect(flash[:notice]).to eq("We have just resent your code")
    end
  end
end
