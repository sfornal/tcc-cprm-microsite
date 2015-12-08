# Main JS for project
console.log 'Hello World!'

$('.checklist-heading').on 'click', ()->
        el = $ this
        unless el.hasClass 'solved'
            el.addClass 'solved'
            icon = $('.checklist-heading-icon', el)
            icon.velocity
                properties:
                    rotateX: '180deg'
                options:
                    duration: 200
                    easing: 'ease-in-out'

        related = $('#' + el.data('related'))
        if related.hasClass 'isClosed'
            related.velocity 'slideDown',
                duration: 500
                easing: 'ease-in-out'
                complete: () ->
                    related.removeClass 'isClosed'
                        .addClass 'isOpen'
        else
            related.velocity 'slideUp',
                duration: 500
                easing: 'ease-in-out'
                complete: () ->
                    related.removeClass 'isOpen'
                        .addClass 'isClosed'
