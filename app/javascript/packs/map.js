import GMaps from 'gmaps/gmaps.js';
import { autocomplete } from '../components/autocomplete';
import { autocompleteCreateTree } from '../components/autocomplete';
import { autocompleteAddressTree } from '../components/autocomplete';




const mapElement = document.getElementById('map');
if (mapElement) { // don't try to build a map if there's no div#map to inject in
  const map = new GMaps({ 
    el: '#map',
    lat: 0,
    lng: 0,
    dragend: function(e) {
      handleMapChange(e);
  }});
  const markers = JSON.parse(mapElement.dataset.markers);

  map.addMarkers(markers);

  if (markers.length === 0) {
    map.setZoom(2);
  } else if (markers.length === 1) {
    map.setCenter(markers[0].lat, markers[0].lng);
    map.setZoom(14);
  } else {
    map.fitLatLngBounds(markers);
  }


  function handleMapChange(e) {
    var bounds = map.getBounds();
    console.log(bounds)
    var ne = bounds.getNorthEast(); // top-left
    var sw = bounds.getSouthWest(); // bottom-right
    var minLat = ne.lat();
    var maxLat = sw.lat();
    var minLng = sw.lng();
    var maxLng = ne.lng();

    var treesPath = mapElement.dataset.treesPath;
    var treeFilters = mapElement.dataset.treesFilter;
    var data = {
      tree_filters: treeFilters,
      minLat: minLat,
      maxLat: maxLat,
      minLng: minLng,
      maxLng: maxLng
    };

    $.ajax({
      type: "POST",
      url: treesPath,
      dataType: "script",
      data: data
    });

/*    fetch(treesPath, {
      method: "POST",
      credentials: "same-origin",
      headers: {
        "Accept": "JS",
        "Content-Type": "JS"
      },
      body: 
    });*/
  
  }
}

autocomplete();
autocompleteCreateTree();
autocompleteAddressTree();
