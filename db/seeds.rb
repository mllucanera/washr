puts "Run seeding process!"

puts "Starting seeding process with clients..."

#Client
C_EMAIL = %w(juanacer@hotmail.com sofian@gmail.com ivanc@gmail.com nicoken@hotmail.com)
C_FIRST_NAME = %w(Juana Sofia Ivan Nicolas)
C_LAST_NAME = %w(Cervetti Ninaus Cosentino Keneddy)

#Washer
W_EMAIL = %w(javeirp@gmail.com lottamendi@yahoo.com)
W_FIRST_NAME = %w(Javeir Lionel)
W_LAST_NAME = %w(Pavon Ottamendi)

#Car
PLATE = %w(EJK224 HNE459 HPG400 MMY329 JTJ539 GKT550 GOO864 JOU360)
COLOR = %w(Blue Grey Black White Black Black Black Black)
NAME = %w(206 Tiida 307 C3 Clio Gol 206 Civic)
BRAND = %w(Peugot Nissan Peugot Citroen Renault Volkswagen Peugot Honda)


t = 0
i = 0
c = 0

# Client data
4.times do
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
  client.remote_photo_url = "https://res.cloudinary.com/logicisaliar/image/upload/v1530545184/user#{t + 1}.jpg"
  client.save
  t += 1

end

8.times do
    #Car data
    car_data = {

      user: User.where(role: :client)[c/2],
      plate: PLATE[c],
      color: COLOR[c],
      name: NAME[c],
      brand: BRAND[c],
      photo: "*"
    }
    car = Car.new(car_data)
    car.save

    car.remote_photo_url = "https://res.cloudinary.com/logicisaliar/image/upload/v1530544575/#{i + 1}.jpg"
    car.save
    puts "Car #{c+1} created"
    c += 1
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
  washer.remote_photo_url = "https://res.cloudinary.com/logicisaliar/image/upload/v1530545192/washer#{t + 1}.jpg"
  washer.save
  t += 1
end

puts "Creating bookings"
first_booking = Booking.create!(address: "La Plata, Buenos Aires Province, Argentina", car: Car.first, status: 0)
second_booking = Booking.create!(address: "Palermo, Buenos Aires, Argentina", car: Car.fifth, status: 3)
third_booking = Booking.create!(address: "Buenos Aires, Firmat, Santa Fe Province, Argentina", car: Car.third, status: 2)

puts "Finished seeding process. Seeds Created"
