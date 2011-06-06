class VehicleUnit < ActiveRecord::Base
  belongs_to :unit_model
  belongs_to :engine_model
  belongs_to :company
end
