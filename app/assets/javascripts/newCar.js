const addCarIndex = document.getElementById("add-car-index");
const formSubmit = document.getElementById("form-submit");
const newCarIndex = document.getElementById("new-car-index");
const index = document.getElementById("index");

if (index) {


  addCarIndex.addEventListener("click", (event) => {
    newCarIndex.classList.remove("hidden");
  });
  formSubmit.addEventListener("click", (event) => {
    newCarIndex.classList.add("hidden");
  });
}

const addCarBooking = document.getElementById("add-car-booking");
if (addCarBooking)
{
  addCarBooking.addEventListener("click", (event) => {
    newCarBooking = document.getElementById("new-car-booking");
    newCarBooking.classList.remove("hidden");
  });
}
