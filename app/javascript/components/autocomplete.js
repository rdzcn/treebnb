function autocomplete() {
  document.addEventListener("DOMContentLoaded", function() {
    const treeLocation = document.getElementById('search');

    if (treeLocation) {
      const autocomplete = new google.maps.places.Autocomplete(treeLocation, { types: [ 'geocode' ] });
      google.maps.event.addDomListener(treeLocation, 'keydown', function(e) {
        if (e.key === "Enter") {
          e.preventDefault(); // Do not submit the form on Enter.
        }
      });
    }
  });
}


function autocompleteCreateTree() {
  document.addEventListener("DOMContentLoaded", function() {
    const treeLocation = document.getElementById('tree_location');

    if (treeLocation) {
      const autocomplete = new google.maps.places.Autocomplete(treeLocation, { types: [ 'geocode' ] });
      google.maps.event.addDomListener(treeLocation, 'keydown', function(e) {
        if (e.key === "Enter") {
          e.preventDefault(); // Do not submit the form on Enter.
        }
      });
    }
  });
}



function autocompleteAddressTree() {
  document.addEventListener("DOMContentLoaded", function() {
    const treeLocation = document.getElementById('tree_address');

    if (treeLocation) {
      const autocomplete = new google.maps.places.Autocomplete(treeLocation, { types: [ 'geocode' ] });
      google.maps.event.addDomListener(treeLocation, 'keydown', function(e) {
        if (e.key === "Enter") {
          e.preventDefault(); // Do not submit the form on Enter.
        }
      });
    }
  });
}


export { autocomplete };
export { autocompleteCreateTree };
export { autocompleteAddressTree };

