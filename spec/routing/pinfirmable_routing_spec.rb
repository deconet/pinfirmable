require "spec_helper"

RSpec.describe "routes for Pinfirmable", type: :routing do
  it "routes /users/confirmemail to the pinfirmable controller" do
    expect(get("/users/confirmemail")).to route_to("devise/pinfirmable#new")
  end

  it "routes /users/pinfirmable to the pinfirmable controller" do
    expect(post("/users/pinfirmable")).to route_to("devise/pinfirmable#create")
  end

  it "routes /users/pinfirmable/resend_email to the pinfirmable controller" do
    expect(post("/users/pinfirmable/resend_email")).to route_to("devise/pinfirmable#resend_email")
  end
end
