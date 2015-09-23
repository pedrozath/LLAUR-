class ImageZoom
	constructor: (@image) ->
		@image.css
			cursor: "zoom"
		do @spawn_magnifier
		@hot_area = $("<div id='hot_area'></div>").css
			position: "absolute"
			backgroundColor: "red"
			zIndex: 2
			width: $("#photo").width()
			height: $("#photo").height()
			left: $("#photo").offset()["left"]+1
			top: $("#photo").offset()["top"]+1
			opacity: 0

		.prependTo("body")

		@hot_area.bind
			mouseenter: => do @show_magnifier
			mouseleave: => do @hide_magnifier
			mousemove: (e) => 
				obj = $(e.target)
			
				position = 
					left: ((e.offsetX/obj.width())*100)
					top: ((e.offsetY/obj.height())*100)

				@log position.left, position.top

				@magnifier.css
					left: position.left - (@magnifier.width()/obj.width()*100)/2 + "%"
					top: position.top - (@magnifier.height()/obj.height()*100)/2 + "%"
					backgroundPosition: "#{position.left}% #{position.top}%"

	spawn_magnifier: =>
		@magnifier = $("<div id='magnifier'></div>").css
			position: "absolute"
			width: "200px"
			height: "200px"
			overflow: "hidden"
			backgroundImage: "url(#{@image.attr "src"})"
			borderRadius: "200px"

		@magnifier.prependTo("#photo").hide()

	show_magnifier: => 
		@magnifier.show()
		
	hide_magnifier: => @magnifier.hide()

	log: (message...) -> 
		# console.log message

$ -> $("#photo img").load -> new ImageZoom $("#photo img")