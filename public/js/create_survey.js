$(document).ready(function() {
  
  $('form').on('click','.del_choice',function(event){
    $(this).parent().parent().remove();
    event.preventDefault();
  });

  $('form' ).on('click', '.add_choice', function(event){
    var question_id = parseInt($(this).parent().parent().parent().parent().attr('id').split('question_')[1]);
    var last_choice = $(this).parent().parent().parent().find('tr').last();
    var next_id = parseInt($(last_choice).attr('id').split('choice_')[1])+1;
    
    $(last_choice).parent().append("<tr id=choice_" + next_id + ">" + last_choice.html() + "</tr>");
    var new_choice = $(this).parent().parent().parent().find('tr').last();
    $(new_choice).find('td:nth-child(2)').find('input').attr("name", "question_" + question_id + "[choice_" + next_id + "]");
    $(new_choice).find('td:nth-child(2)').find('input').attr("placeholder", "Enter Choice " + next_id);
    event.preventDefault();
  });

  $('form').on('click','.del_question',function(event){
    $(this).parent().parent().parent().parent().remove();
    event.preventDefault();
  });

  $('form').on('click', '.add_question', function(event){
    var last_question = $('form').find('table').last();
    var next_id = parseInt($(last_question).attr('id').split('question_')[1]) + 1;
  
    $.ajax({
      type: "GET",
      url: "/new_question/" + next_id,
      dataType: ""
    }).done(function(html) {
        $('.submit_qs').before(html);
    });

    event.preventDefault();
  });

  $('form').on('click', '#submit_qs_button',function (event) {
    
    var data = $('form').serialize();
    console.log(data);
    
    $.ajax({
      type: "POST",
      url: "create",
      data: data
    });

    event.preventDefault();
    //You must still redirect to the new page!!!!
  });
});
