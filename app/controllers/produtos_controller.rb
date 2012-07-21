class ProdutosController < ApplicationController
  
  require 'yaml'
  
  # GET /produtos
  # GET /produtos.json
  
  def index
    
    @produtos = nil
      
    cache =  Rails.cache.read("produtosVpsa")
      
    if cache == nil
      @produtos = HTTParty.get( Ceam::Application::URL_VPSA + '/produtos' )
      Rails.cache.write("produtosVpsa",@produtos.to_yaml, :expires_in => 60.minutes)
    else
      @produtos = YAML::load( cache )
    end
    
    respond_to do |format|
      format.json { render json: @produtos }
    end
    
  end

end
