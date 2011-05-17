class CreateEngineModels < ActiveRecord::Migration
  def self.up
    create_table :engine_models do |t|
      t.string :name
      t.references :engine_brand

      t.timestamps
    end
  end

  def self.down
    drop_table :engine_models
  end
end
