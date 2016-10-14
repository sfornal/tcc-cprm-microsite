# Main JS for project
errorMsg = ''

$('[id|="successInforForm"]').on 'submit', (e) ->
    e.preventDefault()
    form = $ this
    loader = $ '#loader'
    if not validateForm(form)
        $('.field--invalid').velocity 'callout.shake'
        $('.requestInfo-formResponse')
            .empty()
            .append $("<div class='response--error'><p>#{errorMsg}</p></div>")
            .velocity 'transition.slideRightBigIn'
    else
        form.velocity 'transition.slideRightBigOut',
            complete: () ->
                loader.removeClass 'hidden'
                    .velocity 'fadeIn'
                posting = $.post form.attr('action'), form.serialize()

                posting.done (data) ->
                    loader.velocity 'fadeOut'
                    $('.requestInfo-formResponse')
                        .empty()
                        .append data
                        .append $('<button class="button button--reload" id="reload">Continue</button>')
                        .velocity 'transition.slideRightBigIn'

                        $('#reload').on 'click', () ->
                            window.location.reload false

                posting.error (data) ->
                    loader.velocity 'fadeOut'
                    $('.requestInfo-formResponse')
                        .empty()
                        .append(data)
                        .append $('<button class="button button--reload" id="reload">Continue</button>')
                        .velocity 'transition.slideRightBigIn'
                        .velocity 'callout.shake'

                        $('#reload').on 'click', () ->
                            window.location.reload false

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
