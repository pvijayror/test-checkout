require 'spec_helper'

describe "checkouts/index" do
  before(:each) do
    assign(:checkouts, [
      stub_model(Checkout),
      stub_model(Checkout)
    ])
  end

  it "renders a list of checkouts" do
    render
  end
end
