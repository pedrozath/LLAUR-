class Destroyable
    constructor: (options) ->
        for key, value of options 
            this[key] = options[key]

        @id = @element.data().id
        @route = @element.data().route
        @bind_events()

    bind_events: ->
        @element.on "click", (e) =>
            e.preventDefault();
            e.stopPropagation();
            if confirm("Tem certeza que deseja apagar esta categoria? Não há como voltar atrás!")
                @destroy()

    destroy: ->
        $.post @route+@id,
            field: @field
            value: @element.html()
            _method: "delete"
            success: -> location.reload()

@Destroyable = Destroyable