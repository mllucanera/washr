var confirmBooking = document.getElementById("confirm-booking");
var formSubmit = document.getElementById("form-submit");
var newCarIndex = document.getElementById("new-car-index");
var index = document.getElementById("index");

if (index) {
  confirmBooking.addEventListener("click", (event) => {
    newCarIndex.classList.remove("hidden");
  });
}

var addCarBooking = document.getElementById("add-car-booking");
if (addCarBooking)
{
  addCarBooking.addEventListener("click", (event) => {
    newCarBooking = document.getElementById("new-car-booking");
    newCarBooking.classList.remove("hidden");
  });
}
