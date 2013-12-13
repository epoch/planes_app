class Seat < ActiveRecord::Base
  attr_accessible :number, :plane_id, :flight_id

  belongs_to :flight
  has_one :reservation
  #belongs_to :plane, :through => :flight
  #delegate :plane, :to => :flight, :allow_nil => true
  #has_one :plane, :through => :flight


  def vacant?
    reservation ? false : true
  end

  def reserved?
    !vacant?
  end

  def self.vacant
    joins('left outer join reservations on (seats.id=reservations.seat_id)').where('reservations.id is null')
  end

end
