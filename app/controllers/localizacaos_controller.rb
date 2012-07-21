class LocalizacaosController < ApplicationController
  
  # GET /localizacaos
  # GET /localizacaos.json
  def index
    
    if params[:format] != "json"
      @localizacaos = Localizacao.paginate(:page => params[:page], :per_page => 10)
   else
      @localizacaos = Localizacao.all
    end
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @localizacaos, :include => :produtos  }
    end
  end

  # GET /localizacaos/1
  # GET /localizacaos/1.json
  def show
    @localizacao = Localizacao.find(params[:id])
    
    @localizacao.produtos.each do |p|
      
      url = 'https://www.vpsa.com.br/estoque/rest/externo/showroom/93/produtos/' + p.idProduto.to_s
      
      produtoVPSA = HTTParty.get(url)
    
      p.nomeProduto = produtoVPSA['descricao']
      p.estoque = produtoVPSA['quantidadeEmEstoque']
    end
     
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @localizacao.produtos.to_json(:methods => [:nomeProduto,:estoque])}
    end
  end
  
  def loadProdutos
    @localizacao = Localizacao.find(params[:id])
     
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @localizacao.produtos.to_json()}
    end
  end
  
  def find
    @localizacao = Localizacao.find_by_descricao(params[:descricao])
     
    respond_to do |format|
      format.html # show.html.erb
      if @localizacao != nil && @localizacao.produtos != nil
        format.json { render json: @localizacao.produtos.to_json()}
      else
        format.json { render json: '' }
      end
    end
  end

  # GET /localizacaos/new
  # GET /localizacaos/new.json
  def new

    carregarLocalizacao(false)  

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @localizacao }
    end
  end
  
  def carregarLocalizacao(edit)
    
    if !edit
      @localizacao = Localizacao.new
    end
    
    cache = Rails.cache.read("produtos")
    
    @produtos = Array.new
    
    if cache != nil && cache.length > 0
      @produtos = cache
      if edit
        @produtos.each do |produto|
          @localizacao.produtos.each do |pLoc|
            if pLoc.idProduto == produto.idProduto
              produto.checked = 'checked="yes"'
              break
            end
          end
        end
      end
      
    else
      
      url = 'https://www.vpsa.com.br/estoque/rest/externo/showroom/93/produtos/'
      
      produtoVPSA = HTTParty.get(url)
    
      produtoVPSA.each do |p|
      
        produto = ProdutoYaml.new
        produto.nomeProduto = p['descricao']
        produto.idProduto = p['id']
        
        if edit
          @localizacao.produtos.each do |pLoc|

            if pLoc.idProduto == produto.idProduto
              produto.checked = 'checked="yes"'
              break
            end
          end
        end
      
        @produtos << produto
      
      end
      
      Rails.cache.write("produtos", @produtos, :expires_in => 1.days)
      
    end
    
  end

  # GET /localizacaos/1/edit
  def edit
    
    @localizacao = Localizacao.find(params[:id])
    
    carregarLocalizacao(true)
  end

  # POST /localizacaos
  # POST /localizacaos.json
  def create
    ids = params[:produtos_attributes]

    @localizacao = Localizacao.new(:descricao => params[:localizacao]['descricao'])
    
    respond_to do |format|
      if @localizacao.save
        
        ids.each do |id|
          produto = Produto.new
          produto.idProduto = id
          produto.localizacao_id = @localizacao.id
          if !produto.save
            @localizacao.destroy
            break
          end
        end
        
        format.html { redirect_to @localizacao, notice: 'Localizacao criada com sucesso.' }
        format.json { render json: @localizacao, status: :created, location: @localizacao }
      else
        carregarLocalizacao(false)
        format.html { render action: "new" }
        format.json { render json: @localizacao.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /localizacaos/1
  # PUT /localizacaos/1.json
  def update
    @localizacao = Localizacao.find(params[:id])

    respond_to do |format|
      if @localizacao.update_attributes(params[:localizacao])
        
        ids = params[:produtos_attributes]
        
        ids.each do |id|
          produto = Produto.new
          produto.idProduto = id
          produto.localizacao_id = @localizacao.id
          produto.save
        end
        
        format.html { redirect_to @localizacao, notice: 'Localizacao was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @localizacao.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /localizacaos/1
  # DELETE /localizacaos/1.json
  def destroy
    @localizacao = Localizacao.find(params[:id])
    @localizacao.destroy

    respond_to do |format|
      format.html { redirect_to localizacaos_url }
      format.json { head :no_content }
    end
  end
end
