class CreateBreakdownStatuses < ActiveRecord::Migration
  def self.up
    create_table :breakdown_statuses do |t|
      t.string :name

      t.timestamps
    end
  end

  def self.down
    drop_table :breakdown_statuses
  end
end
