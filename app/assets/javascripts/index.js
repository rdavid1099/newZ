$(document).ready(function(){
  $('.reply').click(function() {
    console.log();
    $(this).next('.body').toggle('slow');
  });
});
