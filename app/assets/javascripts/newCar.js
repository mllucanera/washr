const element = document.querySelector("hidden");
element.addEventListener("click", (event) => {
  console.log(event);
  console.log(event.currentTarget);
  element.classList.remove("hidden");
});


// element.classList.add("hidden");

