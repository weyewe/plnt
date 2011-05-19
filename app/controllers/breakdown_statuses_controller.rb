class BreakdownStatusesController < ApplicationController
  # GET /breakdown_statuses
  # GET /breakdown_statuses.xml
  def index
    @breakdown_statuses = BreakdownStatus.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @breakdown_statuses }
    end
  end

  # GET /breakdown_statuses/1
  # GET /breakdown_statuses/1.xml
  def show
    @breakdown_status = BreakdownStatus.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @breakdown_status }
    end
  end

  # GET /breakdown_statuses/new
  # GET /breakdown_statuses/new.xml
  def new
    @breakdown_status = BreakdownStatus.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @breakdown_status }
    end
  end

  # GET /breakdown_statuses/1/edit
  def edit
    @breakdown_status = BreakdownStatus.find(params[:id])
  end

  # POST /breakdown_statuses
  # POST /breakdown_statuses.xml
  def create
    @breakdown_status = BreakdownStatus.new(params[:breakdown_status])

    respond_to do |format|
      if @breakdown_status.save
        format.html { redirect_to(@breakdown_status, :notice => 'Breakdown status was successfully created.') }
        format.xml  { render :xml => @breakdown_status, :status => :created, :location => @breakdown_status }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @breakdown_status.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /breakdown_statuses/1
  # PUT /breakdown_statuses/1.xml
  def update
    @breakdown_status = BreakdownStatus.find(params[:id])

    respond_to do |format|
      if @breakdown_status.update_attributes(params[:breakdown_status])
        format.html { redirect_to(@breakdown_status, :notice => 'Breakdown status was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @breakdown_status.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /breakdown_statuses/1
  # DELETE /breakdown_statuses/1.xml
  def destroy
    @breakdown_status = BreakdownStatus.find(params[:id])
    @breakdown_status.destroy

    respond_to do |format|
      format.html { redirect_to(breakdown_statuses_url) }
      format.xml  { head :ok }
    end
  end
end
