$(document).ready(function () {
  var $signinBody = $('#signin-body')
  var $signinForm = $('#signin-form')

  $('#signin-form').dialog({
    autoOpen: false,
    position: { my: 'center', at: 'top+350', of: window },
    width: 1000,
    resizable: false,
    modal: true,
    show: true,
    hide: true,
    draggable: false
  })

  $('#navbar-signin').on('click', function (event) {
    event.preventDefault()
    $signinForm.dialog('open')
    $signinBody.addClass('is-visible')
    return false
  })

  $signinBody.on('click', function () {
    $signinForm.dialog('close')
    $signinBody.removeClass('is-visible')
  })
})
