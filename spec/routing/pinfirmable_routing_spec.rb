require "spec_helper"

RSpec.describe "routes for Pinfirmable", type: :routing do
  it "routes /users/pinfirmable/new to the pinfirmable controller" do
    expect(get("/users/pinfirmable/new")).to route_to("devise/pinfirmable#new")
  end

  it "routes /users/pinfirmable to the pinfirmable controller" do
    expect(post("/users/pinfirmable")).to route_to("devise/pinfirmable#create")
  end
end
