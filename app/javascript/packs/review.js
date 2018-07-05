const stars = document.querySelectorAll(".fa-star");
console.log("Entry");
stars.forEach(star => {
  star.addEventListener("click", (event) => {
    const btn = document.getElementById('btn-rating');
    btn.setAttribute('href', `/client/bookings/rate/${window.location.href.split("/").slice(-1)[0]}?rating=${star.id}`);
    for (i = 0; i < 5; i++) {
      stars[i].classList.remove("yellow");
    }
    for (i = 0; i <= star.id; i++) {
      stars[i].classList.add("yellow");
    }
    for (i = star.id + 1; i < 5; i++) {
      stars[i].classList.remove("yellow");
    }
  });
});
