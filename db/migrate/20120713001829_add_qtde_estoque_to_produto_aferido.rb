class AddQtdeEstoqueToProdutoAferido < ActiveRecord::Migration
  def change
    add_column :produto_aferidos, :qtdeEstoque, :decimal
  end
end
