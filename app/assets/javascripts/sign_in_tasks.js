$(document).ready(function () {
  $('#navbar-signin').on('click', function (event) {
    event.preventDefault()
    $('#signin-form').dialog({
      autoOpen: true,
      position: { my: 'center', at: 'top+350', of: window },
      width: 1000,
      resizable: false,
      title: 'Sign In',
      modal: true,
      open: '<h1>HEY</h1>',
      buttons: {
        'Button 1': function() {
          console.log('Button 1')
        },
        Cancel: function () {
          console.log('Forget it')
        }
      }
    })
  })
  return false
})
