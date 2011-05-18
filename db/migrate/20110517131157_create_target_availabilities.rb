class CreateTargetAvailabilities < ActiveRecord::Migration
  def self.up
    create_table :target_availabilities do |t|
      t.float :target
      t.references :company
      t.integer :month

      t.timestamps
    end
  end

  def self.down
    drop_table :target_availabilities
  end
end
