require 'combo'
class EngineModel < ActiveRecord::Base
  include Combo
  belongs_to :engine_brand
  has_many :vehicle_units
end
