class Plane < ActiveRecord::Base
  attr_accessible :model

  has_many :flights
  has_many :reservations, :through => :flights 

  def add_flight(options)
    flight = self.flights.new(options)
    1.upto(8) do |num| 
      'A'.upto('D') do |letter|
        flight.seats.build(number: "#{num}#{letter}")
      end
    end
    flight    
  end

  def passengers 
    flights.joins(:reservations => :passenger)
  end

  # Passenger.joins(:reservations => { :flight => :plane  }).where('planes.id = 3')  

end
