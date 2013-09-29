var x = 0;
var y = 0;

$(function() {
        $("#linkMap").click(function() {
          $("#map_canvas").toggle("slow");
        })   
      })

function initialize() {
  var mapOptions = {
          center: new google.maps.LatLng(53.904338,27.55537),
          zoom: 11,
          mapTypeId: google.maps.MapTypeId.ROADMAP
        };
  var map = new google.maps.Map(document.getElementById('map_canvas'),
      mapOptions);

  var prevMarker = null;

  google.maps.event.addListener(map, 'click', function(e) {
    if (prevMarker != null)
    {
      prevMarker.setVisible(false);
    }
    prevMarker =  placeMarker(e.latLng, map);
    x = e.latLng.lat();
    y = e.latLng.lng();

    var xCoord = document.getElementById('flat_coordinates_x');
    xCoord.value = x;
    var yCoord = document.getElementById('flat_coordinates_y');
    yCoord.value = y;
  });

}



function placeMarker(position, map) {
  var marker = new google.maps.Marker({
    position: position,
    map: map
  });
  map.panTo(position);
  return marker;
}

google.maps.event.addDomListener(window, 'load', initialize);
