require "spec_helper"

RSpec.describe Devise::PinfirmableController do
  describe "GET new" do
    before do
      @request.env["devise.mapping"] = Devise.mappings[:user]
    end

    it "returns success" do
      get :new
      expect(response).to be_success
    end
  end
end
