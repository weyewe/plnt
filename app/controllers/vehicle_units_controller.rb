class VehicleUnitsController < ApplicationController
  # GET /vehicle_units
  # GET /vehicle_units.xml
  def index
    @vehicle_units = VehicleUnit.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @vehicle_units }
    end
  end

  # GET /vehicle_units/1
  # GET /vehicle_units/1.xml
  def show
    @vehicle_unit = VehicleUnit.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @vehicle_unit }
    end
  end

  # GET /vehicle_units/new
  # GET /vehicle_units/new.xml
  def new
    @vehicle_unit = VehicleUnit.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @vehicle_unit }
    end
  end

  # GET /vehicle_units/1/edit
  def edit
    @vehicle_unit = VehicleUnit.find(params[:id])
  end

  # POST /vehicle_units
  # POST /vehicle_units.xml
  def create
    @vehicle_unit = VehicleUnit.new(params[:vehicle_unit])

    respond_to do |format|
      if @vehicle_unit.save
        format.html { redirect_to(@vehicle_unit, :notice => 'Vehicle unit was successfully created.') }
        format.xml  { render :xml => @vehicle_unit, :status => :created, :location => @vehicle_unit }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @vehicle_unit.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /vehicle_units/1
  # PUT /vehicle_units/1.xml
  def update
    @vehicle_unit = VehicleUnit.find(params[:id])

    respond_to do |format|
      if @vehicle_unit.update_attributes(params[:vehicle_unit])
        format.html { redirect_to(@vehicle_unit, :notice => 'Vehicle unit was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @vehicle_unit.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /vehicle_units/1
  # DELETE /vehicle_units/1.xml
  def destroy
    @vehicle_unit = VehicleUnit.find(params[:id])
    @vehicle_unit.destroy

    respond_to do |format|
      format.html { redirect_to(vehicle_units_url) }
      format.xml  { head :ok }
    end
  end
end
