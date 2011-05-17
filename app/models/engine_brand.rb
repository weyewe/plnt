class EngineBrand < ActiveRecord::Base
  has_many :engine_models
  
  def self.selections
    manufacturer_selections_result = {}
    
    self.all.each do | manufacturer | 
        manufacturer_selections_result[manufacturer.name] = manufacturer.id
    end
    
    manufacturer_selections_result
  end
end
