puts "Run seeding process!"

puts "Destroying all current data"

User.delete_all
Car.delete_all
Booking.delete_all

puts "Starting seeding process with clients..."

#Client
C_EMAIL = %w(joti@gmail.com luli@gmail.com)
C_FIRST_NAME = %w(Joti Luli)
C_LAST_NAME = %w(Sempe Lucanera)

#Washer
W_EMAIL = %w(jash@gmail.com marcelo@gmail.com)
W_FIRST_NAME = %w(Jash Marcelo)
W_LAST_NAME = %w(Shah Polli)

#Car
PLATE = %w(ABC123 DEF456)
COLOR = %w(Black Red)
NAME = %w(Fiteta Huevo)
BRAND = %w(Honda Mazda)


t = 0
i = 0

2.times do
  # Client data
  client_data = {
    email: C_EMAIL[t],
    password: '123456',
    first_name: C_FIRST_NAME[t],
    last_name: C_LAST_NAME[t],
    role: "client",
    photo: "*"
  }
  # Create client
  client = User.new(client_data)
  client.save
  client.remote_photo_url = "http://res.cloudinary.com/dz9qskljz/image/upload/v1530293193/Profile_pic_washr/Clients/#{t + 1}.jpg"
  client.save
  t += 1

    #Car data
    car_data = {
      user: client,
      plate: PLATE[i],
      color: COLOR[i],
      name: NAME[i],
      brand: BRAND[i],
      photo: "*"
    }
    car = Car.new(car_data)
    car.save
    car.remote_photo_url = "http://res.cloudinary.com/dz9qskljz/image/upload/v1530298915/Profile_pic_washr/Cars/#{i + 1}car.jpg"
    car.save
    i += 1
end


puts "Starting seeding process with washers..."
t = 0

2.times do
  # Washer data
  washer_data = {
    email: W_EMAIL[t],
    password: '123456',
    first_name: W_FIRST_NAME[t],
    last_name: W_LAST_NAME[t],
    role: "washer",
    photo: "*"
  }
  # Create client
  washer = User.new(washer_data)
  washer.save
  washer.remote_photo_url = "http://res.cloudinary.com/dz9qskljz/image/upload/v1530290918/Profile_pic_washr/Washers/#{t + 1}.jpg"
  washer.save
  t += 1
end

first_booking = Booking.create!(car: Car.first, status: 0)
second_booking = Booking.create!(car: Car.second, status: 0)

puts "Finished seeding process. Seeds Created"
