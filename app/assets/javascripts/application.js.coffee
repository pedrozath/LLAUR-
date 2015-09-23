#= require jquery
#= require jquery_ujs
#= require jquery.turbolinks
#= require editable
#= require destroyable

App = 
	editables: []
	destroyables: []

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
			marginTop: scroll * 0.50

		logo.css
			marginTop: scroll * 0.97

	$("[data-editable]").each ->
		App.editables.push new Editable 
			element: $(this)
			route: "/" 

	$("[data-destroyable]").each ->
		App.destroyables.push new Destroyable
			element: $(this)

window.App = App