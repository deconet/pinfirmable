require "spec_helper"

RSpec.describe Devise::PinfirmableController do
  describe "POST create" do
    before do
      @request.env["devise.mapping"] = Devise.mappings[:user]
      @user = User.create(email: "test@example.com", password: "password")
      sign_in @user
    end

    it "returns success" do
      post :create, params: { digits: @user.pinfirmable_pin.split("") }
      expect(response).to be_redirect
    end
  end
end
