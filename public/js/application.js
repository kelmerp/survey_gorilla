



$(document).ready(function() {

  
  
  $(document.forms['sign-up']['user[password]']).on('keyup', function(){
    var sign_up_pass = document.forms['sign-up']['user[password]'].value.length;
    console.log(this.which);
    {
      $('#entered_password-errors').text('Password Must Be At Least 6 Characters');

    }
    else
    {
      $('#entered_password-errors').text(' ');   
    }    
  })


});
