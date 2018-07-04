puts "Run seeding process!"

puts "Starting seeding process with clients..."

#Client
C_EMAIL = %w(juanacer@gmail.com sofian@gmail.com ivanc@gmail.com nicoken@gmail.com)
C_FIRST_NAME = %w(Juana Sofia Ivan Nicolas)
C_LAST_NAME = %w(Cervetti Ninaus Cosentino Keneddy)

#Washer
W_EMAIL = %w(sebastianb@gmail.com saml@gmail.com)
W_FIRST_NAME = %w(Sebastian Sam)
W_LAST_NAME = %w(Buffo Levy)

#Car
PLATE = ["ac 577 ng", "hkr 920", "jjv 695", "pei 066", "mks 719", "ipt 796", "ab 990 uw", "ije 265"]
COLOR = %w(Black Platinium Silver Blue Black Silver Silver Black)
NAME = ["My car", "Dad's", "Honey", "Mum's", "Javier's car", "Mariana's car", "Sweetie Peugeot", "The Kennedy"]
MODEL = ["Prisma Joy", "Corolla", "307", "Spin Activ", "Journey", "Fit", "CRV", "307"]
BRAND = %w(Chevrolet Toyota Peugeot Chevrolet Dodge Honda Honda Peugeot)


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
  client.remote_photo_url = "https://res.cloudinary.com/logicisaliar/image/upload/v1530547670/user#{t + 1}.jpg"

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
      model: MODEL[c],
      brand: BRAND[c],
      photo: "*"
    }
    car = Car.new(car_data)
    car.save

    car.remote_photo_url = "https://res.cloudinary.com/jotisempe/image/upload/a_0/v1530725199/cars/car#{c+1}.jpg"
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

first_booking = Booking.create!(address: "Av. Libertador 4673", car: Car.first, status: 3, user_id: 6)
second_booking = Booking.create!(address: "Ecuador 1458", car: Car.fifth, status: 3)
third_booking = Booking.create!(address: "San Martin de Tours 3307", car: Car.third, status: 0)

puts "Finished seeding process. Seeds Created"

User.create!(email: "samulevy@gmail.com", password: "123456")
