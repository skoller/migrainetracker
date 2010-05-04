class AddRememberTokenToPatients < ActiveRecord::Migration
  def self.up
    add_column :patients, :remember_token, :string
    add_index  :patients, :remember_token
  end

  def self.down
    remove_column :patients, :remember_token
  end
end
