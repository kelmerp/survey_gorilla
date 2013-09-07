$(document.forms['sign-up']['user[password]']).on('keyup', function(){
  var sign_up_pass = document.forms['sign-up']['user[password]'].value.length;
  if (sign_up_pass < 6)
  {
    $('#entered_password-errors').text('Password Must Be At Least 6 Characters');
    document.getElementById('sign_up_button').disabled = true;
  }
  else
  {
    $('#entered_password-errors').text(' ');   
    document.getElementById('sign_up_button').disabled = false;
  }    
})

$(document.forms['sign-up']['user[email]']).on('keyup', function(){
  var sign_up_pass = document.forms['sign-up']['user[email]'].value;
  var email_validate = /\w+\@.+\.\w{2,}/
  if (!email_validate.exec(sign_up_pass))
  {
    $('#email-errors').text('Must be a valid email');
    document.getElementById('sign_up_button').disabled = true;
  }
  else
  {
    $('#email-errors').text(' ');   
    document.getElementById('sign_up_button').disabled = false;
  }    
})
