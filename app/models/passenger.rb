class Passenger < ActiveRecord::Base
  attr_accessible :name

  has_many :reservations
end
