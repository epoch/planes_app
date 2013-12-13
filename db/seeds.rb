%w(Plane Reservation Flight Seat Passenger).each do |model|
  Object.const_get(model).delete_all
end

p1 = Plane.new(model: '747')

f1 = p1.add_flight(number: 'QX120')
f2 = p1.add_flight(number: 'QX150')
p1.save

pass1 = Passenger.create(name: 'Jack')
pass2 = Passenger.create(name: 'Jill')

# f1.seats.where(number: '1A').first
# f1.seats.find_by_number('1A')
# f1.seats['1A']

pass1.reservations.create(flight_id: f1.id, seat_id: f1.seats['1A'].id)
pass2.reservations.create(flight_id: f1.id, seat_id: f1.seats['2C'].id)

p2 = Plane.new(model: 'airbus 300')
f3 = p2.add_flight(number: 'CX200')
p2.save

pass1.reservations.create(flight_id: f3.id, seat_id: f3.seats['1B'].id)

