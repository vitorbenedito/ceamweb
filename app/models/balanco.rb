class Balanco < ActiveRecord::Base
  attr_accessible :nome, :id, :produto_aferidos_attributes, :created_at
  
  has_many :produto_aferidos, :dependent => :destroy
  
  has_one :entidade
  
  accepts_nested_attributes_for :produto_aferidos

  
end


