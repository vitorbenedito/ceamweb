require 'spec_helper'

describe "paginainicials/index" do
  before(:each) do
    assign(:paginainicials, [
      stub_model(Paginainicial),
      stub_model(Paginainicial)
    ])
  end

  it "renders a list of paginainicials" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end
