const selectCar = () => {
  const cars = document.querySelectorAll(".car-js-handler")
  const selectBtns = document.querySelectorAll(".car-select-btn")

  const input = document.getElementById("car_id")
  const newBookingForm = document.getElementById("new_booking_form")

  selectBtns.forEach(selectBtn => {
    selectBtn.addEventListener('click', () => {
      newBookingForm.submit()
      console.log('click');
    })
  })

  cars.forEach(car => {
    let selectBtn = car.parentNode.querySelector(".car-select-btn")

    car.addEventListener('click', () => {
      cars.forEach(i => i.classList.remove("card_selected"))
      selectBtns.forEach(i => i.classList.add("hide_button"))

      input.value = car.id

      car.classList.add("card_selected")
      selectBtn.classList.remove("hide_button")
    })
  })
}

export { selectCar };