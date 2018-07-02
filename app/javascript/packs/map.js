import GMaps from 'gmaps/gmaps.js';

const mapElement = document.getElementById('map');
// don't try to build a map if there's no div#map to inject in
const map = new GMaps({ el: '#map', lat: 0, lng: 0 });
const markers = JSON.parse(mapElement.dataset.markers);
if (markers.length === 1) {
  map.setCenter(markers[0].lat, markers[0].lng);
  map.setZoom(18);
  map.addMarkers(markers);
}
else {
  navigator.geolocation.getCurrentPosition(function(location) {
    var lat = location.coords.latitude;
    var lng = location.coords.longitude;
    map.setCenter(lat, lng);
    map.setZoom(15);
    var marker = new google.maps.Marker({
      position: {lat: lat, lng: lng},
      map: map,
      title: 'Your car is here.',
      icon: 'http://res.cloudinary.com/sebastianbuffosempe/image/upload/v1530550811/carwasher-icon_g7ojz7.png'
    });
    map.addMarker(marker);
  })
}
