class ProdutosController < ApplicationController
  # GET /produtos
  # GET /produtos.json
  
  require 'open-uri'
  require 'json'
  
  def index
    if params[:format] != "json"
      @produtos = Produto.paginate(:page => params[:page], :per_page => 10)
    
      @produtos.each do |p|
      
        url = 'https://www.vpsa.com.br/estoque/rest/externo/showroom/1/produtos/' + p.idProduto.to_s
      
        produtoVPSA = HTTParty.get(url)
    
        p.nomeProduto = produtoVPSA['descricao']
        p.estoque = produtoVPSA['quantidadeEmEstoque']
      end 
    else
      
      produtosVPSA = HTTParty.get('https://www.vpsa.com.br/estoque/rest/externo/showroom/93/produtos')
      
      @localizacoes = Localizacao.all
      
      @localizacoes.each do |l|
        l.produtos.each do |p|
          
          produtosVPSA.each do |pVpsa|
            
            if p.idProduto == pVpsa['id']
              p.nomeProduto = pVpsa['descricao']
              p.estoque = pVpsa['quantidadeEmEstoque']
              break
            end
          end
        end
      end
      
      semLocalizacao = Localizacao.new
      semLocalizacao.descricao = 'Sem Localizacao'
      semLocalizacao.produtos = []
      
      produtosVPSA.each do |pVpsa|
       
        encontrouProduto = false
        
        @localizacoes.each do |l|
          l.produtos.each do |p|
              if p.idProduto == pVpsa['id']
                encontrouProduto = true
                break
              end
          end
          if encontrouProduto 
            break 
          end
        end
        if !encontrouProduto
            novoProduto = Produto.new
            novoProduto.nomeProduto = pVpsa['descricao']
            novoProduto.idProduto = pVpsa['id']
            novoProduto.estoque = pVpsa['quantidadeEmEstoque']
            semLocalizacao.produtos << novoProduto
        end
      end
        
      
      @localizacoes << semLocalizacao
      
    end
    
    
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @localizacoes, :include => { :produtos => {:methods => [:nomeProduto,:estoque]} } }
    end
  end

  # GET /produtos/1
  # GET /produtos/1.json
  def show
    @produto = Produto.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @produto }
    end
  end

  # GET /produtos/new
  # GET /produtos/new.json
  def new
    @produto = Produto.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @produto }
    end
  end

  # GET /produtos/1/edit
  def edit
    @produto = Produto.find(params[:id])
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

  # PUT /produtos/1
  # PUT /produtos/1.json
  def update
    @produto = Produto.find(params[:id])

    respond_to do |format|
      if @produto.update_attributes(params[:produto])
        format.html { redirect_to @produto, notice: 'Produto was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @produto.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /produtos/1
  # DELETE /produtos/1.json
  def destroy
    @produto = Produto.find(params[:id])
    @produto.destroy

    respond_to do |format|
      format.html { redirect_to produtos_url }
      format.json { head :no_content }
    end
  end
end
