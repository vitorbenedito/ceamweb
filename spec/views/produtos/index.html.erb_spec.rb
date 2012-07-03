require 'spec_helper'

describe "produtos/index" do
  before(:each) do
    assign(:produtos, [
      stub_model(Produto,
        :idProduto => 1,
        :idLocalizacao => 2,
        :qtdeEncontrada => "9.99"
      ),
      stub_model(Produto,
        :idProduto => 1,
        :idLocalizacao => 2,
        :qtdeEncontrada => "9.99"
      )
    ])
  end

  it "renders a list of produtos" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
  end
end
