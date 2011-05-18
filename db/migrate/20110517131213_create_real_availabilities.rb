class CreateRealAvailabilities < ActiveRecord::Migration
  def self.up
    create_table :real_availabilities do |t|
      t.float :availability
      t.integer :day
      
      t.references :category
      t.references :company

      t.timestamps
    end
  end

  def self.down
    drop_table :real_availabilities
  end
end
