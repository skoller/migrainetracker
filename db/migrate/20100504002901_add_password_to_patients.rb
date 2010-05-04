class AddPasswordToPatients < ActiveRecord::Migration
  def self.up
    add_column :patients, :encrypted_password, :string
  end

  def self.down
    remove_column :patients, :encrypted_password
  end
end
