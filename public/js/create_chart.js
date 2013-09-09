var questions = $('.q_num');

$(document).ready(function() {
  var id = $('#survey_id').text();
  
  $.ajax({
    type: "GET",
    url: '/survey/'+ id + '/charts',
    data: {},
    success: function() {},
    dataType: 'json'
  }).done(function(survey_data) {
      var questions = survey_data.choices;
      var q_index = 0;
      $.each(questions, function(question, resp) {
        var ctx = $("#myChart_"+q_index).get(0).getContext("2d");
        choice_data = new Array();
        $.each(resp, function(choice, ct){
          choice_data.push({
            value: ct,
            color: '#'+Math.floor(Math.random()*16777215).toString(16),
            label: choice
          });
        });
        new Chart(ctx).Pie(choice_data);
        q_index++;
      });
      
  });


});
