class Headach < ActiveRecord::Base
  belongs_to :patient
  validates_length_of :start_time, :maximum => 10
end
