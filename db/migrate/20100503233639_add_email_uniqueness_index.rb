class AddEmailUniquenessIndex < ActiveRecord::Migration
  def self.up
    add_index :Patients, :email, :unique => true
  end

  def self.down
    remove_index :Patients, :email
  end
end
