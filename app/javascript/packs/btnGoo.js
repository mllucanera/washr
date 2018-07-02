const btnGooFunc = () => {
  const addressInput = document.getElementById("address-input")
  addressInput.addEventListener("click", changeHeight())
  console.log("here")
}

const changeHeight = () => console.log("My input has a value!");

export { btnGooFunc };

