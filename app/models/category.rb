require 'combo'
class Category < ActiveRecord::Base
  include Combo
  has_many :classifications
  has_many :availibilities
  has_many :breakdowns
  
  def self.selections
    category_selections_result = {}
    
    self.all.each do | category | 
        category_selections_result[category.name] = category.id
    end
    
    category_selections_result
  end
  
  
end
