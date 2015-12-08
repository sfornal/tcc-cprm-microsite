# Main JS for project
console.log 'Hello World!'

$('.checklist-heading').on 'click', ()->
        el = this
        $(el).addClass 'solved'
