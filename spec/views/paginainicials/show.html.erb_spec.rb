require 'spec_helper'

describe "paginainicials/show" do
  before(:each) do
    @paginainicial = assign(:paginainicial, stub_model(Paginainicial))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end
