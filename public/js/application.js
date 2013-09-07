$(document).ready(function() {
  $('#sign_up_pass').on('keyup', function(){
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

  $('#sign_up_email').on('keyup', function(){
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

  $('.del_choice').on('click',function(){
    $(this).parent().parent().remove();
  });

  $('.add_choice').on('click',function(){
    var last_choice = $(this).parent().parent().parent().find('tr').last();
    var next_id = parseInt($(last_choice).attr('id').split('choice_')[1])+1;
    
    $(last_choice).parent().append("<tr id=choice_" + next_id + ">" + last_choice.html() + "</tr>");
    var new_choice = $(this).parent().parent().parent().find('tr').last();
    console.log(new_choice.find('td:nth-child(2)').find('input').attr("name"));
  });

});
