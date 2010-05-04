class AddSaltToPatients < ActiveRecord::Migration
  def self.up
    add_column :patients, :salt, :string
  end

  def self.down
    remove_column :patients, :salt
  end
end
