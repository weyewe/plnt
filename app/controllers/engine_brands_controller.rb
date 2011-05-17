class EngineBrandsController < ApplicationController
  # GET /engine_brands
  # GET /engine_brands.xml
  def index
    @engine_brands = EngineBrand.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @engine_brands }
    end
  end

  # GET /engine_brands/1
  # GET /engine_brands/1.xml
  def show
    @engine_brand = EngineBrand.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @engine_brand }
    end
  end

  # GET /engine_brands/new
  # GET /engine_brands/new.xml
  def new
    @engine_brand = EngineBrand.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @engine_brand }
    end
  end

  # GET /engine_brands/1/edit
  def edit
    @engine_brand = EngineBrand.find(params[:id])
  end

  # POST /engine_brands
  # POST /engine_brands.xml
  def create
    @engine_brand = EngineBrand.new(params[:engine_brand])

    respond_to do |format|
      if @engine_brand.save
        format.html { redirect_to(@engine_brand, :notice => 'Engine brand was successfully created.') }
        format.xml  { render :xml => @engine_brand, :status => :created, :location => @engine_brand }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @engine_brand.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /engine_brands/1
  # PUT /engine_brands/1.xml
  def update
    @engine_brand = EngineBrand.find(params[:id])

    respond_to do |format|
      if @engine_brand.update_attributes(params[:engine_brand])
        format.html { redirect_to(@engine_brand, :notice => 'Engine brand was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @engine_brand.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /engine_brands/1
  # DELETE /engine_brands/1.xml
  def destroy
    @engine_brand = EngineBrand.find(params[:id])
    @engine_brand.destroy

    respond_to do |format|
      format.html { redirect_to(engine_brands_url) }
      format.xml  { head :ok }
    end
  end
end
