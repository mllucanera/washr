function autocomplete() {
  document.addEventListener("DOMContentLoaded", function() {
    var addressInput = document.getElementById('address-input');

    if (addressInput) {
      var autocomplete = new google.maps.places.Autocomplete(addressInput, { types: [ 'geocode' ] });
      google.maps.event.addDomListener(addressInput, 'keydown', function(e) {
      });
    }
  });
}

export { autocomplete };
