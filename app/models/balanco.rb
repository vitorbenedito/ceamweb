class Balanco < ActiveRecord::Base
  attr_accessible :nome, :id
  
  has_many :produto_aferidos
end
