import GMaps from 'gmaps/gmaps.js';

const mapElement = document.getElementById('map');
// don't try to build a map if there's no div#map to inject in
const map = new GMaps({ el: '#map', lat: 0, lng: 0 });
const markers = JSON.parse(mapElement.dataset.markers);
map.addMarkers(markers);
if (markers.length === 1) {
    map.setCenter(markers[0].lat, markers[0].lng);
    map.setZoom(18);
  }
   else {
    navigator.geolocation.getCurrentPosition(function(location) {
    var lat = location.coords.latitude;
    var lng = location.coords.longitude;
    map.setCenter(lat, lng);
    map.setZoom(15);
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
