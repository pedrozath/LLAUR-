class ImageViewer
    constructor: ->
        @thumbs = $("a img")

        @thumbs.on "click", (e) => 
            e.preventDefault()
            @open $(e.currentTarget).parent().attr "href"

        @viewer = $("<div class='viewer'><span>Carregando...</span></div>").prependTo("body")
        @viewer.css
            position: "fixed"
            left: 0
            top: 0
            width: "100%"
            height: "100%"
            zIndex: 4
            background: "rgba(0,0,0,0.8)"
            display: "none"
            padding: "20px"
            color: "#fff"

        @loading_text = @viewer.find("span")
        @loading_text.css
            position: "absolute"
            left: ($(window).width()-@loading_text.width())/2
            top: ($(window).height()-@loading_text.height())/2

        @close_btn = $("<a href='#'>X</a>")
        @close_btn.prependTo @viewer
        @close_btn.css
            position: "absolute"
            right: "5px"
            top: "5px"
            borderRadius: "20px"
            backgroundColor: "#000"
            padding: "10px"
            lineHeight: 1
            color: "#fff"
            textDecoration: "none"
            zIndex: 6

        @close_btn.on "click", (e) =>
            e.preventDefault()
            @close()

    open: (image_url) ->
        @viewer.fadeIn()
        @new_image = $("<img />")
        @new_image.attr "src", image_url

        @new_image.on "load", =>
            smallest_dimension = 
                if @new_image.width() > $(window).width()
                    "height"
                else 
                    "width"
            @new_image.appendTo @viewer
            @new_image.hide()
            @new_image.css smallest_dimension, "100%"
            @new_image.css 
                zIndex: 5
                position: "relative"
            @new_image.fadeIn()


        @new_image[0].src = @new_image[0].src

    close: -> @viewer.fadeOut => @new_image.remove()

@ImageViewer = ImageViewer