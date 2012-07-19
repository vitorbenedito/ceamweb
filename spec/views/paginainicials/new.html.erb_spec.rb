require 'spec_helper'

describe "paginainicials/new" do
  before(:each) do
    assign(:paginainicial, stub_model(Paginainicial).as_new_record)
  end

  it "renders new paginainicial form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => paginainicials_path, :method => "post" do
    end
  end
end
