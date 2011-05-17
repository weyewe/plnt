class CreateVehicleUnits < ActiveRecord::Migration
  def self.up
    create_table :vehicle_units do |t|
      t.string :name  # equipment_name
      t.string :local_number
      t.string :chasis_number
      t.string :engine_number
      t.text :remarks
      
      t.date :production_date
      t.date :purchase_date
      
      t.references :unit_model
      t.references :engine_model
      

      t.timestamps
    end
  end

  def self.down
    drop_table :vehicle_units
  end
end
