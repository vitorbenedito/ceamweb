class Produto < ActiveRecord::Base
  
  attr_accessible :idProduto, :localizacao_id
  
  attr_accessor :nomeProduto, :estoque, :checked
  
  belongs_to :localizacao
  
  validates_uniqueness_of :idProduto, :scope => :localizacao_id, :msg => "Ja existe o produto na localizacao."
  
  validates :idProduto, :uniqueness => true
  
  before_validation :deletaProdutoExistenteEmOutraLocalizacao
  
  def deletaProdutoExistenteEmOutraLocalizacao
    
    produto = Produto.find_by_idProduto(idProduto)
    if(produto != nil && produto.localizacao_id != localizacao_id)
      produto.destroy
    end
    
  end
  
end
