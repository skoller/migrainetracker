class Patient < ActiveRecord::Base
  has_many :headaches
end
