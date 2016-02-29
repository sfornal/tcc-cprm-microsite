# Main JS for project
errorMsg = ''

$('.checklist-heading').on 'click', (e) ->
    if $('html').hasClass 'basic-page'
        return false

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
            .append $("<div class='response--error'><p>#{errorMsg}</p></div>")
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
    errorMsg = ''
    inputs = $('input', $form)
    required = true
    inputs.each (index, el) ->
        if el.value is ''
            required = false
            $(el).addClass 'field--invalid'
    errorMsg += 'One or more required fields are empty.<br/>' if not required

    emails = true
    emailpattern = /[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?/
    emailInputs = $('input[type="email"]', $form)
    emailInputs.each (index, el) ->
        unless emailpattern.test el.value
            emails = false
            $(el).addClass 'field--invalid'
    errorMsg += 'Please make sure emails are in the form <i>someone@somewhere.com</i><br/>' if not emails

    return required and emails

$(document).on 'ready', () ->
    edit = document.getElementById('edit-link')
    direct = document.getElementById('de')
    edit?.parentNode?.replaceChild(direct, edit) if direct?
