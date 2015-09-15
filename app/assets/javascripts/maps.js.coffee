google.maps.event.addDomListener window, 'load', ->
	new google.maps.Geocoder().geocode
		address: "Av. dos Eucaliptos, 800 São paulo, SP"
	, (result) ->
		loja_cia_das_capas = result[0].geometry.location
		map = new google.maps.Map $(".map")[0],
			center: loja_cia_das_capas
			zoom: 15
			mapTypeId: google.maps.MapTypeId.ROADMAP

		new google.maps.Marker
			position: loja_cia_das_capas
			map: map
			animation: google.maps.Animation.BOUNCE

		# current_position = new google.maps.LatLng window.current_position[0], window.current_position[1]

		# new google.maps.DirectionsService().route
		# 	origin: current_position
		# 	destination: loja_cia_das_capas
		# 	travelMode: google.maps.TravelMode.DRIVING
		# , (directions, status) ->
		# 	new google.maps.DirectionsRenderer
		# 		directions: directions
		# 		map: map
		# 		preserveViewport: true
		# 		supressMarkers: true