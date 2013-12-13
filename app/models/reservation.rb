class Reservation < ActiveRecord::Base
  attr_accessible :flight_id, :passenger_id, :seat_id

  belongs_to :passenger
  belongs_to :flight
  belongs_to :seat

  def seat_number
    seat.number
  end
end
