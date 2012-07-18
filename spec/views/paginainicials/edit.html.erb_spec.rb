require 'spec_helper'

describe "paginainicials/edit" do
  before(:each) do
    @paginainicial = assign(:paginainicial, stub_model(Paginainicial))
  end

  it "renders the edit paginainicial form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => paginainicials_path(@paginainicial), :method => "post" do
    end
  end
end
