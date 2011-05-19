class AvailabilitiesController < ApplicationController
  def index
    @availability = Availability.new 
    @availabilities = Availability.find(:all, :conditions => {
      :year => Time.now.year.to_i,
      :month => Time.now.month.to_i
    })
  end
  
  def create
    Availability.handle_data( params )
    redirect_to availabilities_url
  end
end



