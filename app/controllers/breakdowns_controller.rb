class BreakdownsController < ApplicationController
  # GET /breakdowns
  # GET /breakdowns.xml
  def index
    @breakdowns = Breakdown.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @breakdowns }
    end
  end

  # GET /breakdowns/1
  # GET /breakdowns/1.xml
  def show
    @breakdown = Breakdown.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @breakdown }
    end
  end

  # GET /breakdowns/new
  # GET /breakdowns/new.xml
  def new
    @breakdown = Breakdown.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @breakdown }
    end
  end

  # GET /breakdowns/1/edit
  def edit
    @breakdown = Breakdown.find(params[:id])
  end

  # POST /breakdowns
  # POST /breakdowns.xml
  def create
    @breakdown = Breakdown.new(params[:breakdown])
    if params[:breakdown][:is_fixed].to_i == 0 
      @breakdown.is_fixed = false
      @breakdown.fixed_date = nil
    else
      @breakdown.is_fixed = true
    end
    

    respond_to do |format|
      if @breakdown.save
        format.html { redirect_to(@breakdown, :notice => 'Breakdown was successfully created.') }
        format.xml  { render :xml => @breakdown, :status => :created, :location => @breakdown }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @breakdown.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /breakdowns/1
  # PUT /breakdowns/1.xml
  def update
    @breakdown = Breakdown.find(params[:id])

    respond_to do |format|
      if @breakdown.update_attributes(params[:breakdown])
        format.html { redirect_to(@breakdown, :notice => 'Breakdown was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @breakdown.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /breakdowns/1
  # DELETE /breakdowns/1.xml
  def destroy
    @breakdown = Breakdown.find(params[:id])
    @breakdown.destroy

    respond_to do |format|
      format.html { redirect_to(breakdowns_url) }
      format.xml  { head :ok }
    end
  end
  
  def show_breakdowns_on_date
    @month = params[:month].to_i
    @day = params[:day].to_i
    @year = params[:year].to_i 
    
    @breakdowns = Breakdown.where( "fixed_date >  :fixed_date AND breakdown_date <= :breakdown_date", 
                  :fixed_date => Time.local(@year, @month, @day) , 
                  :breakdown_date => Time.local(@year, @month, @day) )
    

  end
end
