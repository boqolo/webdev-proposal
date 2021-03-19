(function() {
  // this returns a Geolocation object which is the main
  // class by which to retrtieve location of the device
  let geo = navigator.geolocation; 
  let opts = {
    enableHighAccuracy: true,
    timeout: 5000 // time after which it will error if info not received
  }

  // this handler can be registered when the position is 
  // retrieved and have access to do things with the coords
  let success = (geoPosn) => {
    let crd = geoPosn.coords;
    let elem = document.getElementById("loc");
    elem.innerHTML = `Your location is ${crd.latitude}, ${crd.longitude} with accuracy of ${crd.accuracy}`;
    // TODO use coords to check if in range of an existing social radius
  };

  // NOTE: second arg is the error handler which takes a 
  // GeolocationPositionError
  geo.getCurrentPosition(success, (err) => err, opts);

  // this can be used to register a handler every time the
  // location of the devices changes. This can consume
  // a lot of resources so it would be nice to only use when
  // needed. Fortunately, you can unregister it with its `id`
  // and the `clearWatch` function
  
  let opts2 = {
    enableHighAccuracy: true,
    maximumAge: 30000, // can't use values in cache older than this in ms
    timeout: 15000
  };

  let success2 = (geoPosn) => {
    console.log(geoPosn.coords.latitude, geoPosn.coords.longitude);
  };

  id = geo.watchPosition(success2, (err) => err, opts2)
  // TODO check if you are in range of an existing social radius
  //  list current networks around you

  geo.clearWatch(id)
  // TODO clear the watch handler once you've joined a network to
  //  save resources

})();
