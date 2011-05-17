class UnitModelsController < ApplicationController
  # GET /unit_models
  # GET /unit_models.xml
  def index
    @unit_models = UnitModel.all.sort_by{ |x| x.manufacturer_id }

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @unit_models }
    end
  end

  # GET /unit_models/1
  # GET /unit_models/1.xml
  def show
    @unit_model = UnitModel.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @unit_model }
    end
  end

  # GET /unit_models/new
  # GET /unit_models/new.xml
  def new
    @unit_model = UnitModel.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @unit_model }
    end
  end

  # GET /unit_models/1/edit
  def edit
    @unit_model = UnitModel.find(params[:id])
  end

  # POST /unit_models
  # POST /unit_models.xml
  def create
    @unit_model = UnitModel.new(params[:unit_model])

    respond_to do |format|
      if @unit_model.save
        format.html { redirect_to(@unit_model, :notice => 'Unit model was successfully created.') }
        format.xml  { render :xml => @unit_model, :status => :created, :location => @unit_model }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @unit_model.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /unit_models/1
  # PUT /unit_models/1.xml
  def update
    @unit_model = UnitModel.find(params[:id])

    respond_to do |format|
      if @unit_model.update_attributes(params[:unit_model])
        format.html { redirect_to(@unit_model, :notice => 'Unit model was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @unit_model.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /unit_models/1
  # DELETE /unit_models/1.xml
  def destroy
    @unit_model = UnitModel.find(params[:id])
    @unit_model.destroy

    respond_to do |format|
      format.html { redirect_to(unit_models_url) }
      format.xml  { head :ok }
    end
  end
end
