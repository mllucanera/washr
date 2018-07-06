puts "Run seeding process!"

puts "Starting seeding process with clients..."

#Clients
client1 = User.new(
  email: "luli@gmail.com",
  password: "123456",
  first_name: "Luli",
  last_name:"Lucanera",
  role: "client",
  )

client1.skip_confirmation!
client1.save
client1.remote_photo_url = "https://res.cloudinary.com/dz9qskljz/image/upload/v1530802861/WASHR/Clients/client1.jpg"
client1.skip_confirmation!
client1.save

puts "Client 1 created"

client1_car1 = Car.new(
  user_id: client1.id,
  plate: "ac 577 ng",
  color: "Black",
  name: "My car",
  model: "Prisma Joy",
  brand: "Chevrolet",
  photo: "*"
  )
client1_car1.save
client1_car1.remote_photo_url = "https://res.cloudinary.com/dz9qskljz/image/upload/a_0/v1530802976/WASHR/Cars/car1.jpg"
client1_car1.save

puts "Car 1 for client 1 created"

client1_car2 = Car.new(
  user_id: client1.id,
  plate: "hkr 920",
  color: "Platinium",
  name: "Dad's",
  model: "Corolla",
  brand: "Toyota",
  photo: "*"
  )
client1_car2.save
client1_car2.remote_photo_url = "https://res.cloudinary.com/dz9qskljz/image/upload/a_0/v1530802976/WASHR/Cars/car2.jpg"
client1_car2.save

puts "Car 2 for client 1 created"

client1_car3 = Car.new(
  user_id: client1.id,
  plate: "jjv 695",
  color: "Silver",
  name: "Honey",
  model: "307",
  brand: "Peugeot",
  photo: "*"
  )
client1_car3.save
client1_car3.remote_photo_url = "https://res.cloudinary.com/dz9qskljz/image/upload/a_0/v1530802976/WASHR/Cars/car3.jpg"
client1_car3.save

puts "Car 3 for client 1 created"

client2 = User.new(
  email: "sam@gmail.com",
  password: "123456",
  first_name: "Sam",
  last_name:"Levy",
  role: "client",
  )
client2.skip_confirmation!
client2.save
client2.remote_photo_url = "https://res.cloudinary.com/dz9qskljz/image/upload/v1530802861/WASHR/Clients/client2.jpg"
client2.skip_confirmation!
client2.save

puts "Client 2 created"

client2_car1 = Car.new(
  user_id: client2.id,
  plate: "pei 066",
  color: "Blue",
  name: "Mum's",
  model: "Spin",
  brand: "Chevrolet",
  photo: "*"
  )
client2_car1.save
client2_car1.remote_photo_url = "https://res.cloudinary.com/dz9qskljz/image/upload/a_0/v1530802976/WASHR/Cars/car4.jpg"
client2_car1.save

puts "Car 1 for client 2 created"

client2_car2 = Car.new(
  user_id: client2.id,
  plate: "mks 719",
  color: "Black",
  name: "Javier's car",
  model: "Journey",
  brand: "Dodge",
  photo: "*"
  )
client2_car2.save
client2_car2.remote_photo_url = "https://res.cloudinary.com/dz9qskljz/image/upload/a_0/v1530802976/WASHR/Cars/car5.jpg"
client2_car2.save

puts "Car 2 for client 2 created"

client3 = User.new(
  email: "justo@gmail.com",
  password: "123456",
  first_name: "Justo",
  last_name:"Simian",
  role: "client",
  )
client3.skip_confirmation!
client3.save
client3.remote_photo_url = "https://res.cloudinary.com/dz9qskljz/image/upload/v1530802861/WASHR/Clients/client3.jpg"
client3.skip_confirmation!
client3.save

puts "Client 3 created"

client4 = User.new(
  email: "joti@gmail.com",
  password: "123456",
  first_name: "Joti",
  last_name:"Sempe",
  role: "client",
  )
client4.skip_confirmation!
client4.save
client4.remote_photo_url = "https://res.cloudinary.com/dz9qskljz/image/upload/v1530802946/WASHR/Washers/washer3.jpg"
client4.skip_confirmation!
client4.save

puts "Client 4 created"

puts "Starting seeding process with washers..."

#Washers

washer1 = User.new(
  email: "jash@gmail.com",
  password: "123456",
  first_name: "Jash",
  last_name:"Shah",
  role: "washer",
  )
washer1.skip_confirmation!
washer1.save
washer1.remote_photo_url = "https://res.cloudinary.com/dz9qskljz/image/upload/v1530802946/WASHR/Washers/washer1.jpg"
washer1.skip_confirmation!
washer1.save

washer_profile1 = WasherProfile.new(
  user_id: washer1.id,
  dni_id: 35458796,
  phone_number: 114589273
  )
washer_profile1.remote_dni_photo_url = "https://res.cloudinary.com/dz9qskljz/image/upload/v1530802946/WASHR/Washers/washer1.jpg"
washer_profile1.save

puts "Washer 1 created"

washer2 = User.new(
  email: "seba@gmail.com",
  password: "123456",
  first_name: "Seba",
  last_name:"Buffo Sempe",
  role: "washer",
  )
washer2.skip_confirmation!
washer2.save
washer2.remote_photo_url = "https://res.cloudinary.com/dz9qskljz/image/upload/v1530802946/WASHR/Washers/washer2.jpg"
washer2.skip_confirmation!
washer2.save

washer_profile2 = WasherProfile.new(
  user_id: washer2.id,
  dni_id: 35458796,
  phone_number: 114589273
  )
washer_profile2.remote_dni_photo_url = "https://res.cloudinary.com/dz9qskljz/image/upload/v1530802946/WASHR/Washers/washer2.jpg"
washer_profile2.save

puts "Washer 2 created"

puts "Finished seeding process. Seeds Created"

=begin
CAR = [6 7 8]
PLATE = ["ipt 796", "ab 990 uw", "ije 265"]
COLOR = %w(Silver Silver Black)
NAME = ["Mariana's car", "Sweetie Peugeot", "The Kennedy"]
MODEL = ["Fit", "CRV", "307"]
BRAND = %w(Honda Honda Peugeot)
=end
