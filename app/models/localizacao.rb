class Localizacao < ActiveRecord::Base
  attr_accessible :descricao
  
  has_many :produtos, :dependent => :destroy, :uniq => true
  

  def self.search(search)
    if search
      where(:descricao => search)
    else
      scoped
    end
  end
  
end
