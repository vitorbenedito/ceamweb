class ProdutoAferido < ActiveRecord::Base
  belongs_to :balanco
  attr_accessible :idProduto, :qtdeAferida,:qtdeEstoque, :balanco_id
  
  attr_accessor :nomeProduto, :estoque
end
