const starit = () => {
  const stars = document.querySelectorAll(".fa-star");

  stars.forEach(star => {
    star.addEventListener("click", (event) => {
      const btn = document.getElementById('btn-rating');
      btn.setAttribute('href', `/client/bookings/rate/${window.location.href.split("/").slice(-1)[0]}?rating=${star.id}`);
      for (let i = 0; i < 5; i++) {
        stars[i].classList.remove("yellow");
      }
      for (let i = 0; i <= star.id; i++) {
        stars[i].classList.add("yellow");
      }
      for (let i = star.id + 1; i < 5; i++) {
        stars[i].classList.remove("yellow");
      }
    });
  })
}

export { starit };