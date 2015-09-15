class DynamicColumn
	constructor: (dynamic_column) ->
		@dynamic_column = $(dynamic_column)
		@offset = @dynamic_column.prev().outerWidth()
		$(window).resize =>
			do @adjust_everything

	adjust_everything: ->
		do @set_width
		do @position

	set_width: ->
		@dynamic_column.width $(window).width()-@offset
	
	position: ->
		@dynamic_column.css
			paddingLeft: @offset

@DynamicColumn = DynamicColumn