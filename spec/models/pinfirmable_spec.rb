# frozen_string_literal: true
require 'spec_helper'

describe Pinfirmable do
  it 'calls emailer after create' do
    expect(PinfirmableMailer)
      .to receive(:pin_email).with(an_instance_of(User))
      .and_return(double('PinfirmableMailer', deliver: true))

    u = User.new(
      email: 'test@example.com',
      password: 'password'
    )
    u.save
  end

  context "skip pinfirmation!" do
    it "doesn't call emailer" do
      expect(PinfirmableMailer)
        .not_to receive(:pin_email)
      u = User.new(
        email: 'test@example.com',
        password: 'password'
      )
      u.skip_pinfirmation!
      u.save
    end

    it "doesn't set the PIN" do
      u = User.new(
        email: 'test@example.com',
        password: 'password'
      )
      u.skip_pinfirmation!
      u.save
      expect(u.reload.pinfirmable_pin).to eq(nil)
    end
  end
end
