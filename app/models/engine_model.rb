require 'combo'
class EngineModel < ActiveRecord::Base
  include Combo
  belongs_to :engine_brand
end
