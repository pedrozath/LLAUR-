#= require jquery
#= require jquery_ujs
#= require jquery.turbolinks
#= require editable
#= require destroyable
#= require image_viewer

App = 
	editables: []
	destroyables: []

$ ->
	if $(window).width() > 420
		header_entrada = $("header.entrada")
		imagem_entrada = header_entrada.find(".imagem-entrada")
		logo = header_entrada.find(".logo")
		btn = header_entrada.find(".btn")
		
		$(window).on "resize", ->
			header_entrada.css
				height: imagem_entrada.height()

			btn.css
				left: ($(window).width()-btn.outerWidth())*0.5
				top: ($(window).height()-btn.height())*0.8

		imagem_entrada.on "load", -> $(window).trigger "resize"
		imagem_entrada[0].src = imagem_entrada[0].src
		btn.on "click", (e) ->
			e.preventDefault()
			$("html, body").animate
				scrollTop: $("main").offset().top
			, 2000

		$(window).trigger "resize"

		contact_box_visible = false
		
		contact_box = $("footer")

		hide_contact_box = -> contact_box.addClass "hidden"
		show_contact_box = -> contact_box.removeClass "hidden"

		$(document).on "scroll", (e) -> 

			scroll = $(document).scrollTop()
			imagem_entrada.css
				marginTop: scroll * 0.50

			logo.css
				marginTop: scroll * 0.97

			btn.css
				marginTop: scroll * 0.40

			main = $("h2")

			passou_da_entrada = main.offset().top < scroll+$(window).height()

			if passou_da_entrada
				unless contact_box_visible then show_contact_box()
				contact_box_visible = true
			else
				if contact_box_visible then hide_contact_box()
				contact_box_visible = false

		$(document).trigger "scroll"

		$("[data-editable]").each ->
			App.editables.push new Editable 
				element: $(this)
				route: "/" 

		$("[data-destroyable]").each ->
			App.destroyables.push new Destroyable
				element: $(this)

		$("footer header").on "click", (e) ->
			e.stopPropagation() 
			$("footer").toggleClass("active")

		$("footer").on "click", -> 
			$("footer").addClass("active") unless $("footer").hasClass("active")

		contact_form = $("footer form")

		contact_form.on "submit", (e) ->
			e.preventDefault()
			$("footer input[type='submit']").attr "disabled", "disabled"
			$("footer input[type='submit']").val "Enviando..."
			$.post "/contato", contact_form.serialize(), ->
				$("footer .conteudo").html("Sua mensagem foi enviada com sucesso. Em breve lhe retornaremos.")

		new ImageViewer

	else
		$("footer").removeClass "hidden"
		$("footer").addClass "active"

	window.App = App