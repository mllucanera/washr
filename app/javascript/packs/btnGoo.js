const btnGooFunc = () => {
  const addressInput = document.getElementById("address-input")
  addressInput.addEventListener('input', changeHeight)
}

const changeHeight = () => {
  const btnGooWrapper = document.getElementById("btn-goo-wrapper")
  const map = document.getElementById("map")
  btnGooWrapper.classList.remove('hidden')
  map.classList.remove('map-home-input-empty')
  map.classList.add('map-home-input-filled')
}

export { btnGooFunc };