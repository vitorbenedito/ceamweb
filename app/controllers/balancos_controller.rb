class BalancosController < ApplicationController
  # GET /balancos
  # GET /balancos.json
  
  before_filter :autenticar_usuario?
  
  def index
    entidades = HTTParty.get(url_vpsa_load_entidades)

    @entidades = Array.new
    
    entidades.each do |entidade|
      @entidades << Entidade.create_from_hash( entidade )
    end
    puts @entidades.inspect

    @balancos = Balanco.paginate(:page => params[:page], :per_page => 10)
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @balancos }
      
    end
  end

  # GET /balancos/1
  # GET /balancos/1.json
  def show
    @balanco = Balanco.find(params[:id])
    
    @balanco.produto_aferidos.each do |p|
      
      url = Ceam::Application::URL_VPSA + '/produtos/' + p.idProduto.to_s
      
      produtoVPSA = HTTParty.get(url)
    
      p.nomeProduto = produtoVPSA['descricao']
      p.estoque = produtoVPSA['quantidadeEmEstoque']
    end
    
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @balanco.produtos.to_json(:methods => [:nomeProduto,:estoque])}
    end
  end

  # GET /balancos/new
  # GET /balancos/new.json
  def new
    @balanco = Balanco.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @balanco }
    end
  end

  # GET /balancos/1/edit
  def edit
    @balanco = Balanco.find(params[:id])
  end

  # POST /balancos
  # POST /balancos.json
  def create
    @balanco = Balanco.new(params[:balanco])
    respond_to do |format|
      if @balanco.save        
          format.html { redirect_to @balanco, notice: 'Balanco criado com sucesso.' }
          format.json { render json: @balanco, status: :created, location: @balanco }
      else
          format.html { render action: "new" }
          format.json { render json: @balanco.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /balancos/1
  # PUT /balancos/1.json
  def update
    @balanco = Balanco.find(params[:id])

    respond_to do |format|
      if @balanco.update_attributes(params[:balanco])
        format.html { redirect_to @balanco, notice: 'Balanco atualizado com sucesso' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @balanco.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /balancos/1
  # DELETE /balancos/1.json
  def destroy
    @balanco = Balanco.find(params[:id])
    @balanco.destroy

    respond_to do |format|
      format.html { redirect_to balancos_url }
      format.json { head :no_content }
    end
  end
end
