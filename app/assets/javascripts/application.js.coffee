#= require jquery
#= require jquery_ujs
#= require jquery.turbolinks
# require bootstrap
# require dropzone
# require image_zoom
# require contacts_controller
# require maps

$ ->
	header_entrada = $("header.entrada")
	imagem_entrada = header_entrada.find(".imagem-entrada")
	logo = header_entrada.find(".logo")
	
	$(window).on "resize", ->
		header_entrada.css
			height: imagem_entrada.height()

	imagem_entrada.on "load", -> $(window).trigger "resize"
	imagem_entrada[0].src = imagem_entrada[0].src

	$(document).on "scroll", (e) -> 
		scroll = $(document).scrollTop()
		imagem_entrada.css
			marginTop: scroll * 0.85

		logo.css
			marginTop: scroll * 0.97



# $ -> 
	# do $(".carousel").carousel
	# $(window).load -> $(window).resize()

	# refresh = (resource) -> 
	# 	$.get "/#{resource}", (html) -> 
	# 		$("##{resource}").html html
	# 		main_administration()
		
	# main_administration = ->
	# 	$("[data-action='destroy']").click ->
	# 		$.post $(this).attr("href"), {_method: "delete" }, (html) => 
	# 			refresh "produtos"
	# 			refresh "categories"
	# 		false

	# choose_photo = ->
	# 	if $("#photo").size()
	# 		$(".photo a").click ->
	# 			$.get $(this).attr("href"), (html) -> $("#photo").html html
	# 			false

	# choose_photo()
	# main_administration()

	# $(".dropzone").dropzone
	# 	init: -> this.on "success", -> 
	# 		refresh "produtos"
	# 		refresh "categories"