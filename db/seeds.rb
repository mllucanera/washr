luli = User.create!(role: "client", first_name: "Luli", last_name: "Lucanera", phone: "2914168790", email: "mllucanera@gmail.com", password: "123456")
joti = User.create!(role: "client", first_name: "Joti", last_name: "Sempe", phone: "2914168790", email: "joti@gmail.com", password: "123456")
jash = User.create!(role: "washer", first_name: "Jash", last_name: "Hash", phone: "2914168790", email: "jash@gmail.com", password: "123456", photo: "https://picsum.photos/200/300/?random")
marcelo = User.create!(role: "washer", first_name: "Marcelo", last_name: "Polli", phone: "2914168790", email: "marcelo@gmail.com", password: "123456", photo: "https://picsum.photos/200/300/?random")

huevo = Car.create!(plate: "ABC123", color: "red", name: "huevo", brand: "mazda", photo: "https://picsum.photos/200/300/?random", user: luli)
fiteta = Car.create!(plate: "HXS939", color: "black", name: "fiteta", brand: "honda", photo: "https://picsum.photos/200/300/?random", user: joti)

first_booking = Booking.create!(car: fiteta, status: 0)
second_booking = Booking.create!(car: huevo, status: 0)

