require 'spec_helper'

describe "produtos/edit" do
  before(:each) do
    @produto = assign(:produto, stub_model(Produto,
      :idProduto => 1,
      :qtdeAferida => "9.99",
      :localizacao => nil
    ))
  end

  it "renders the edit produto form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => produtos_path(@produto), :method => "post" do
      assert_select "input#produto_idProduto", :name => "produto[idProduto]"
      assert_select "input#produto_qtdeAferida", :name => "produto[qtdeAferida]"
      assert_select "input#produto_localizacao", :name => "produto[localizacao]"
    end
  end
end
