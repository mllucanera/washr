import GMaps from 'gmaps/gmaps.js';
import { autocomplete } from '../components/autocomplete';

autocomplete();

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
    map.addMarkers(marker);
  })
}


const styles = [
{
  "featureType": "landscape.natural",
  "elementType": "geometry.fill",
  "stylers": [
  {
    "visibility": "on"
  },
  {
    "color": "#e0efef"
  }
  ]
},
{
  "featureType": "poi",
  "elementType": "geometry.fill",
  "stylers": [
  {
    "visibility": "on"
  },
  {
    "hue": "#1900ff"
  },
  {
    "color": "#c0e8e8"
  }
  ]
},
{
  "featureType": "road",
  "elementType": "geometry",
  "stylers": [
  {
    "lightness": 100
  },
  {
    "visibility": "simplified"
  }
  ]
},
{
  "featureType": "road",
  "elementType": "labels",
  "stylers": [
  {
    "visibility": "off"
  }
  ]
},
{
  "featureType": "transit.line",
  "elementType": "geometry",
  "stylers": [
  {
    "visibility": "on"
  },
  {
    "lightness": 700
  }
  ]
},
{
  "featureType": "water",
  "elementType": "all",
  "stylers": [
  {
    "color": "#7dcdcd"
  }
  ]
}
];
map.addStyle({
  styles: styles,
  mapTypeId: 'map_style'
});
map.setStyle('map_style');

