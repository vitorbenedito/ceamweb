class ProdutosController < ApplicationController
  
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
  
  # POST /produtos
  # POST /produtos.json
  def create
    @produto = Produto.new(params[:produto])

    respond_to do |format|
    if @produto.save
        format.html { redirect_to @produto, notice: 'Produto was successfully created.' }
        format.json { render json: @produto, status: :created, location: @produto }
    else
        format.html { render action: "new" }
        format.json { render json: @produto.errors, status: :unprocessable_entity }
      end
    end
  end

end
