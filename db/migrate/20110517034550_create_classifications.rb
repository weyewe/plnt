class CreateClassifications < ActiveRecord::Migration
  def self.up
    create_table :classifications do |t|
      t.string :name
      t.references :category
      t.timestamps
    end
  end

  def self.down
    drop_table :classifications
  end
end
