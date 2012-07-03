require 'spec_helper'

describe "produtos/new" do
  before(:each) do
    assign(:produto, stub_model(Produto,
      :idProduto => 1,
      :idLocalizacao => 1,
      :qtdeEncontrada => "9.99"
    ).as_new_record)
  end

  it "renders new produto form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => produtos_path, :method => "post" do
      assert_select "input#produto_idProduto", :name => "produto[idProduto]"
      assert_select "input#produto_idLocalizacao", :name => "produto[idLocalizacao]"
      assert_select "input#produto_qtdeEncontrada", :name => "produto[qtdeEncontrada]"
    end
  end
end
