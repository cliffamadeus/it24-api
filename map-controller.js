  // Initialize the Leaflet map
  var map = L.map('sample-map').setView([8.361277, 124.867941], 16);

  // Add a base map (you can choose different tile providers)
  L.tileLayer('https://tile.openstreetmap.org/{z}/{x}/{y}.png', {
    maxZoom: 19,
    attribution: '&copy; <a href="http://www.openstreetmap.org/copyright">OpenStreetMap</a>'
  }).addTo(map);

  // Fetch the JSON data
  fetch('api.php')
    .then(response => response.json())
    .then(jsonData => {
      // Add polygon to the map
      var polygon = L.polygon(jsonData.map_polygon_vertices, { color: 'blue' })
        .addTo(map)
        .bindPopup(jsonData.map_name);

      // Add pins to the map
      jsonData.map_pins.forEach(function (pin) {
        L.marker([pin.pin_lat, pin.pin_lng]).addTo(map)
          .bindPopup(pin.pin_name + '<br>Created by: ' + pin.pin_created_by);
      });
    })
    .catch(error => console.error('Error fetching JSON:', error));