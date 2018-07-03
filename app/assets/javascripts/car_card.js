var confrimBooking = document.getElementById("confirm-booking");
var loading = document.getElementById("loading");
var confirmView = document.getElementById("confirm-view");

confrimBooking.addEventListener("click", (event) => {
  confirmView.classList.add("hidden");
  loading.classList.remove("hidden");
});
