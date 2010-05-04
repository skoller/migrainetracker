class AddAdminToPatients < ActiveRecord::Migration
  def self.up
    add_column :patients, :admin, :boolean
  end

  def self.down
    remove_column :patients, :admin
  end
end
