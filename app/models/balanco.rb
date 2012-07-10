class Balanco < ActiveRecord::Base
  attr_accessible :nome
  
  has_many :produto_aferidos
end
