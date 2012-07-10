class BalancosController < ApplicationController
  # GET /balancos
  # GET /balancos.json
  def index

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
        format.html { redirect_to @balanco, notice: 'Balanco was successfully created.' }
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
        format.html { redirect_to @balanco, notice: 'Balanco was successfully updated.' }
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
