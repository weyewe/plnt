require "combo"
class UnitModel < ActiveRecord::Base
  include Combo
  belongs_to :manufacturer
  has_many :vehicle_units
  
end
