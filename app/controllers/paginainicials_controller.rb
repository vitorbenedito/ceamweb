class PaginainicialsController < ApplicationController
  # GET /paginainicials
  # GET /paginainicials.json
  def index
    #@paginainicials = Paginainicial.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @paginainicials }
    end
  end

  # GET /paginainicials/1
  # GET /paginainicials/1.json
  def show
    @paginainicial = Paginainicial.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @paginainicial }
    end
  end

  # GET /paginainicials/new
  # GET /paginainicials/new.json
  def new
    @paginainicial = Paginainicial.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @paginainicial }
    end
  end

  # GET /paginainicials/1/edit
  def edit
    @paginainicial = Paginainicial.find(params[:id])
  end

  # POST /paginainicials
  # POST /paginainicials.json
  def create
    @paginainicial = Paginainicial.new(params[:paginainicial])

    respond_to do |format|
      if @paginainicial.save
        format.html { redirect_to @paginainicial, notice: 'Paginainicial was successfully created.' }
        format.json { render json: @paginainicial, status: :created, location: @paginainicial }
      else
        format.html { render action: "new" }
        format.json { render json: @paginainicial.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /paginainicials/1
  # PUT /paginainicials/1.json
  def update
    @paginainicial = Paginainicial.find(params[:id])

    respond_to do |format|
      if @paginainicial.update_attributes(params[:paginainicial])
        format.html { redirect_to @paginainicial, notice: 'Paginainicial was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @paginainicial.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /paginainicials/1
  # DELETE /paginainicials/1.json
  def destroy
    @paginainicial = Paginainicial.find(params[:id])
    @paginainicial.destroy

    respond_to do |format|
      format.html { redirect_to paginainicials_url }
      format.json { head :no_content }
    end
  end
end
