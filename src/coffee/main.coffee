# Main JS for project

$('.checklist-heading').on 'click', (e) ->
        e.preventDefault()
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

        related = $(el.attr 'href')
        if related.hasClass 'isClosed'
            related.velocity 'slideDown',
                duration: 200
                easing: 'linear'
                complete: () ->
                    related.removeClass 'isClosed'
                        .addClass 'isOpen'
                    el.attr 'aria-expanded', 'true'
        else
            related.velocity 'slideUp',
                duration: 500
                easing: 'ease-in-out'
                complete: () ->
                    related.removeClass 'isOpen'
                        .addClass 'isClosed'
                    el.attr 'aria-expanded', 'false'

$('#requestInfoForm').on 'submit', (e) ->
    e.preventDefault()
    form = $ this
    if not validateForm(form)
        $('.field--invalid').velocity 'callout.shake'
        $('.requestInfo-formResponse')
            .empty()
            .append $('<div class="response--error"><p>Please fill in all required fields</p></div>')
            .velocity 'transition.slideRightBigIn'
    else
        form.velocity 'transition.slideRightBigOut',
            complete: () ->
                posting = $.post form.attr('action'), form.serialize()

                posting.done (data) ->
                    $('.requestInfo-formResponse')
                        .empty()
                        .append data
                        .velocity 'transition.slideRightBigIn'

                posting.error (data) ->
                    $('.requestInfo-formResponse')
                        .empty()
                        .append(data)
                        .velocity 'transition.slideRightBigIn'
                        .velocity 'callout.shake'

validateForm = ($form) ->
    # Form is a jquery object
    inputs = $('input', $form)
    valid = true
    inputs.each (index, el) ->
        if el.value is ''
            valid = false
            $(el).addClass 'field--invalid'
    return valid
