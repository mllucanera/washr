const rate = () => {
  const stars = document.querySelectorAll(".fa-star");

  stars.forEach(star => {
    star.addEventListener("click", (event) => {
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
}

export { rate }