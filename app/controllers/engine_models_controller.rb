class EngineModelsController < ApplicationController
  # GET /engine_models
  # GET /engine_models.xml
  def index
    @engine_models = EngineModel.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @engine_models }
    end
  end

  # GET /engine_models/1
  # GET /engine_models/1.xml
  def show
    @engine_model = EngineModel.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @engine_model }
    end
  end

  # GET /engine_models/new
  # GET /engine_models/new.xml
  def new
    @engine_model = EngineModel.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @engine_model }
    end
  end

  # GET /engine_models/1/edit
  def edit
    @engine_model = EngineModel.find(params[:id])
  end

  # POST /engine_models
  # POST /engine_models.xml
  def create
    @engine_model = EngineModel.new(params[:engine_model])

    respond_to do |format|
      if @engine_model.save
        format.html { redirect_to(@engine_model, :notice => 'Engine model was successfully created.') }
        format.xml  { render :xml => @engine_model, :status => :created, :location => @engine_model }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @engine_model.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /engine_models/1
  # PUT /engine_models/1.xml
  def update
    @engine_model = EngineModel.find(params[:id])

    respond_to do |format|
      if @engine_model.update_attributes(params[:engine_model])
        format.html { redirect_to(@engine_model, :notice => 'Engine model was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @engine_model.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /engine_models/1
  # DELETE /engine_models/1.xml
  def destroy
    @engine_model = EngineModel.find(params[:id])
    @engine_model.destroy

    respond_to do |format|
      format.html { redirect_to(engine_models_url) }
      format.xml  { head :ok }
    end
  end
end
