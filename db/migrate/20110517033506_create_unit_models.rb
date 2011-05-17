class CreateUnitModels < ActiveRecord::Migration
  def self.up
    create_table :unit_models do |t|
      t.string :name
      t.references :manufacturer

      t.timestamps
    end
  end

  def self.down
    drop_table :unit_models
  end
end
