class Localizacao < ActiveRecord::Base
  attr_accessible :descricao,:id, :produtos_attributes
  
  has_many :produtos, :dependent => :destroy, :uniq => true
  
  accepts_nested_attributes_for :produtos
  

  def self.search(search)
    if search
      where(:descricao => search)
    else
      scoped
    end
  end
  
end
