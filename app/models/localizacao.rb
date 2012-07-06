class Localizacao < ActiveRecord::Base
  attr_accessible :descricao
  
  has_many :produtos
  

  def self.search(search)
    if search
      where('descricao LIKE ?', "%#{search}%")
    else
      scoped
    end
  end
  
end
