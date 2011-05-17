class TargetAvailabilitiesController < ApplicationController
  def index
    @target_availability = TargetAvailability.new 
    @real_availability = RealAvailability.new 
  end
  
end
