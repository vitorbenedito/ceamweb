class Entidade < ActiveRecord::Base

  attr_accessor :nome
  attr_accessible :idEntidadeVpsa, :cnpjEmpresa
  validates_uniqueness_of :idEntidadeVpsa, :scope => :cnpjEmpresa

  def self.create_from_hash( hash )
    entidade = Entidade.new
    entidade.idEntidadeVpsa = hash["id"]
    entidade.nome = hash["nome"] 
    return entidade
  end
end