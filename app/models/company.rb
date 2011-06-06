require 'combo'
class Company < ActiveRecord::Base
  include Combo
  has_many :availibilities
  has_many :breakdowns
  has_many :vehicle_units
  
  def self.selections
    manufacturer_selections_result = {}
    
    self.all.each do | manufacturer | 
        manufacturer_selections_result[manufacturer.name] = manufacturer.id
    end
    
    manufacturer_selections_result
  end
end
