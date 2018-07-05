import GMaps from 'gmaps/gmaps.js';

const mapElement = document.getElementById('map');
// don't try to build a map if there's no div#map to inject in
const map = new GMaps({
  el: '#map',
  lat: 0,
  lng: 0,
  zoom: 5,
  zoomControl : true,
  zoomControlOpt: {
    style : "SMALL",
    position: "TOP_RIGHT"
  },
  panControl : true,
  streetViewControl : false,
  mapTypeControl: false,
  overviewMapControl: false,
  disableDefaultUI: true
});

// Adding style to Map
var styles = [
{
  "featureType": "administrative",
  "elementType": "geometry.fill",
  "stylers": [
  {
    "visibility": "on"
  },
  {
    "color": "#004357"
  }
  ]
},
{
  "featureType": "administrative",
  "elementType": "labels.text.fill",
  "stylers": [
  {
    "color": "#ffffff"
  }
  ]
},
{
  "featureType": "administrative",
  "elementType": "labels.text.stroke",
  "stylers": [
  {
    "color": "#008db4"
  }
  ]
},
{
  "featureType": "administrative.land_parcel",
  "elementType": "labels",
  "stylers": [
  {
    "visibility": "off"
  }
  ]
},
{
  "featureType": "landscape.man_made",
  "elementType": "geometry.fill",
  "stylers": [
  {
    "color": "#004f64"
  }
  ]
},
{
  "featureType": "landscape.natural",
  "elementType": "geometry.fill",
  "stylers": [
  {
    "visibility": "on"
  },
  {
    "color": "#006382"
  }
  ]
},
{
  "featureType": "poi",
  "elementType": "geometry.fill",
  "stylers": [
  {
    "color": "#006a87"
  }
  ]
},
{
  "featureType": "poi",
  "elementType": "labels.text",
  "stylers": [
  {
    "visibility": "off"
  }
  ]
},
{
  "featureType": "poi",
  "elementType": "labels.text.fill",
  "stylers": [
  {
    "lightness": 80
  }
  ]
},
{
  "featureType": "poi",
  "elementType": "labels.text.stroke",
  "stylers": [
  {
    "color": "#0085a9"
  }
  ]
},
{
  "featureType": "road",
  "elementType": "geometry.fill",
  "stylers": [
  {
    "color": "#003544"
  }
  ]
},
{
  "featureType": "road",
  "elementType": "geometry.stroke",
  "stylers": [
  {
    "visibility": "off"
  }
  ]
},
{
  "featureType": "road",
  "elementType": "labels.text.fill",
  "stylers": [
  {
    "color": "#81e2ff"
  }
  ]
},
{
  "featureType": "road",
  "elementType": "labels.text.stroke",
  "stylers": [
  {
    "visibility": "off"
  }
  ]
},
{
  "featureType": "road.local",
  "elementType": "labels",
  "stylers": [
  {
    "visibility": "off"
  }
  ]
},
{
  "featureType": "transit",
  "elementType": "geometry.fill",
  "stylers": [
  {
    "color": "#007291"
  }
  ]
},
{
  "featureType": "transit",
  "elementType": "labels.text.fill",
  "stylers": [
  {
    "color": "#bcefff"
  }
  ]
},
{
  "featureType": "transit",
  "elementType": "labels.text.stroke",
  "stylers": [
  {
    "color": "#006280"
  }
  ]
},
{
  "featureType": "water",
  "elementType": "geometry.fill",
  "stylers": [
  {
    "color": "#0087ad"
  }
  ]
},
{
  "featureType": "water",
  "elementType": "labels.text.fill",
  "stylers": [
  {
    "lightness": "-100"
  }
  ]
}
];

map.addStyle({
  styledMapName:"Styled Map",
  styles: styles,
  mapTypeId: "map_style"
});

map.setStyle("map_style");

const markers = JSON.parse(mapElement.dataset.markers);
map.addMarkers(markers);
console.log(markers);

if (markers.length === 1) {
  map.setCenter(markers[0].lat, markers[0].lng);
  map.setZoom(18);
}
else if (markers.length > 1) {
  map.fitLatLngBounds(markers);
}
else {
  navigator.geolocation.getCurrentPosition(function(location) {
    var lat = location.coords.latitude;
    var lng = location.coords.longitude;
    map.setCenter(lat, lng);
    map.setZoom(18);
    var marker = new google.maps.Marker({
      position: {lat: lat, lng: lng},
      title: 'Your car is here.',
      icon: 'https://res.cloudinary.com/jotisempe/image/upload/v1530712696/map-icon.png'
    });
    map.addMarker(marker);
  })
}
