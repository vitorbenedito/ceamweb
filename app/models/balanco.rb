class Balanco < ActiveRecord::Base
  attr_accessible :nome, :id, :produto_aferidos_attributes
  
  has_many :produto_aferidos
  accepts_nested_attributes_for :produto_aferidos
end
