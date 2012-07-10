class ProdutoAferido < ActiveRecord::Base
  belongs_to :balanco
  attr_accessible :idProduto, :qtdeAferida
end
