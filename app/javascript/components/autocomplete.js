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

export { autocomplete };
