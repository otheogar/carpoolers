jQuery ->
    mapOptions =
        center: new google.maps.LatLng(34.419255,-119.698869),
        zoom: 8,
        mapTypeId: google.maps.MapTypeId.ROADMAP
    map = new google.maps.Map $("#map_canvas").get(0), mapOptions


