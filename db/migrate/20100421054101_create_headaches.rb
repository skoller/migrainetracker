class CreateHeadaches < ActiveRecord::Migration
  def self.up
    create_table :headaches do |t|
      t.integer :start_time
      t.integer :duration
      t.string :initial_severity
      t.string :max_severity
      t.string :notes

      t.timestamps
    end
  end

  def self.down
    drop_table :headaches
  end
end
