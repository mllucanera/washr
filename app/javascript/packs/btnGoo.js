const addressInput = document.getElementById("address-input")

if (addressInput && addressInput.value) {
  changeHeight()
}

const btnGooFunc = () => {
  if (addressInput) {
    addressInput.addEventListener('input', changeHeight)
  }
}

function changeHeight() {
  const btnGooWrapper = document.getElementById("btn-goo-wrapper")
  const map = document.getElementById("map")
  btnGooWrapper.classList.remove('hidden')
  map.classList.remove('map-home-input-empty')
  map.classList.add('map-home-input-filled')
}

const inputBlur = () => {
  addressInput.onblur = function () {

    google.maps.event.trigger(this, 'focus', {});
    google.maps.event.trigger(this, 'keydown', {
        keyCode: 13
    });
  };
}



export { btnGooFunc, inputBlur };
