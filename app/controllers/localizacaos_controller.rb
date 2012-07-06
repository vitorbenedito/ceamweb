class LocalizacaosController < ApplicationController
  # GET /localizacaos
  # GET /localizacaos.json
  def index

    @localizacaos = Localizacao.paginate(:page => params[:page], :per_page => 10)
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @localizacaos }
    end
  end

  # GET /localizacaos/1
  # GET /localizacaos/1.json
  def show
    @localizacao = Localizacao.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @localizacao }
    end
  end

  # GET /localizacaos/new
  # GET /localizacaos/new.json
  def new
    @localizacao = Localizacao.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @localizacao }
    end
  end

  # GET /localizacaos/1/edit
  def edit
    @localizacao = Localizacao.find(params[:id])
  end

  # POST /localizacaos
  # POST /localizacaos.json
  def create
    @localizacao = Localizacao.new(params[:localizacao])

    respond_to do |format|
      if @localizacao.save
        format.html { redirect_to @localizacao, notice: 'Localizacao was successfully created.' }
        format.json { render json: @localizacao, status: :created, location: @localizacao }
      else
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
