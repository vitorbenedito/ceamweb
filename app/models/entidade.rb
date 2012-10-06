class Entidade < ActiveRecord::Base

  attr_accessible :idEntidadeVpsa, :cnpjEmpresa
  
   validates_uniqueness_of :idEntidadeVpsa, :scope => :cnpjEmpresa
  
end


