require "spec_helper"

RSpec.describe "routes for Pinfirmable", type: :routing do
  it "routes /users/pinfirmable/new to the pinfirmable controller" do
    expect(get("/users/pinfirmable/new")).to route_to("devise/pinfirmable#new")
  end
end
