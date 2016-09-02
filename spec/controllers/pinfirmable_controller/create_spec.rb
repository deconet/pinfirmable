require "spec_helper"
require "timecop"

RSpec.describe Devise::PinfirmableController do
  describe "POST create" do
    before do
      @request.env["devise.mapping"] = Devise.mappings[:user]
      @user = User.create(email: "test@example.com", password: "password")
      sign_in @user
    end

    context "correct pin" do
      it "returns success" do
        post :create, params: { digits: @user.pinfirmable_pin.split("") }
        expect(response).to redirect_to("/")
      end
    end

    context "incorrect pin" do
      let(:pin) { %w(1 2 3 4 5 6) }

      it "returns success" do
        post :create, params: { digits: pin }
        expect(response).to redirect_to("/users/pinfirmable/new")
      end

      it "increments the tries" do
        post :create, params: { digits: pin }
        expect(@user.reload.pinfirmable_tries).to eq(1)
      end

      it "after 3 tries the user is stopped from trying anymore pins for 1 minute" do
        Timecop.freeze(Time.now)
        3.times { post :create, params: { digits: pin } }
        expect(@user.reload.pinfirmable_lockout).to eq(1.minute.from_now)
      end

      it "after 6 tries the user is stopped from trying anymore pins for 1 minute" do
        3.times { post :create, params: { digits: pin } }
        Timecop.freeze(2.minutes.from_now)
        3.times { post :create, params: { digits: pin } }
        expect(@user.reload.pinfirmable_lockout).to eq(2.minutes.from_now)
      end

      it "while locked out no tries are allowed" do
        Timecop.freeze(Time.now)
        4.times { post :create, params: { digits: pin } }
        expect(response.status).to eq(429)
      end

      it "after the lockout you can try again" do
        Timecop.freeze(Time.now)
        4.times { post :create, params: { digits: pin } }
        Timecop.freeze(2.minutes.from_now)
        post :create, params: { digits: pin }
        expect(@user.reload.pinfirmable_tries).to eq(4)
      end
    end
  end
end
