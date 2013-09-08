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
      var questions = survey_data.questions;
      $.each(questions, function(q_index) {
        var ctx = $("#myChart_"+q_index).get(0).getContext("2d");
        //Get context with jQuery - using jQuery's .get() method.
        //This will get the first returned node in the jQuery collection.
        var q = $(survey_data.questions[q_index].id);
        //console.log(survey_data.choices);
        //Iterate through options
        var choices = new Array;
        $.each(survey_data.choices, function (index){
          if(survey_data.choices[index].question_id === survey_data.questions[q_index].id)
          {
            choices.push(survey_data.choices[index])
          }
        });
        console.log(choices);
        
        //New Chart
        var myNewChart = new Chart(ctx);
        
        //This is one question
        var data = new Array();

        //this is one option
        data.push(
        {
          value: 30,
          color: "#F38630",
          label: "Whatevs"
        });

        data.push(
        {
          value: 50,
          color: "#E0E4CC",
          label: "Blargh"
        });

        data.push(
        {
          value: 100,
          color: "#69D2E7",
          label: "Dat"
        });     

        new Chart(ctx).Pie(data);
      });

      
  });


});
