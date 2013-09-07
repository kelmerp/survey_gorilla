$(document).ready(function() {

  

  $('#del_choice').find('a').on('click',function(){
    $(this).parent().parent().remove();
  });

});
