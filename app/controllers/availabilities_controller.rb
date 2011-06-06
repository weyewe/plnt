class AvailabilitiesController < ApplicationController
  def index
    @availability = Availability.new 
    
    if params[:direction].nil? 
      @month = params[:month] || Time.now.month
      @year = params[:year] || Time.now.year
      @availabilities = Availability.find(:all, :conditions => {
        :year => @year.to_i,
        :month => @month.to_i
      })
    else
      if params[:direction] == "next"
        time = Time.local( params[:year].to_i , params[:month].to_i).next_month
      elsif params[:direction] == "prev"
        time = Time.local( params[:year].to_i , params[:month].to_i).prev_month
      end
      @month = time.month
      @year = time.year
      @availabilities = Availability.find(:all, :conditions => {
        :year => @year.to_i,
        :month => @month.to_i
      })
    end
    
  end
  
  def create
    Availability.handle_data( params )
    redirect_to availabilities_url( :year => params[:year], :month => params[:month])
  end
end



