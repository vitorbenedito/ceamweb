class Produto < ActiveRecord::Base
  
  attr_accessible :idProduto, :localizacao_id
  
  attr_accessor :nomeProduto, :estoque
  
  belongs_to :localizacao
  
end
