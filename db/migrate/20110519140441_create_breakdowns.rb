class CreateBreakdowns < ActiveRecord::Migration
  def self.up
    create_table :breakdowns do |t|
      t.integer :hmkm
      t.text :progress_job
      t.text :rfu_estimation
      t.integer :percentage_fixed
      t.date :breakdown_date
      t.date :fixed_date
      t.boolean :is_fixed
      
      t.references :company
      t.references :category 
      t.references :breakdown_status

      t.timestamps
    end
  end

  def self.down
    drop_table :breakdowns
  end
end
