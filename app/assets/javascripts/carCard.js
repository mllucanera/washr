var confirmBooking = document.getElementById("confirm-booking");

if (confirmBooking) {
  var loading = document.getElementById("loading");
  var confirmView = document.getElementById("confirm-view");

  confirmBooking.addEventListener("click", (event) => {
    confirmView.classList.add("hidden");
    loading.classList.remove("hidden");
    confirmBooking.classList.add("hidden");
  });
}