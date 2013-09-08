var questions = $('.q_num');

$(document).ready(function() {
  var id = $('#survey_id').text();
  
  var all = $.ajax({
          type: "GET",
          url: '/survey/'+ id + '/results',
          data: {},
          success: function(survey_data) {
            console.log(survey_data);
          },
          dataType: 'json'
        });

  //One question at a time
  $('.q_num').each(function(index) {
    var ctx = $("#myChart_"+index).get(0).getContext("2d");
    //Get context with jQuery - using jQuery's .get() method.
    //This will get the first returned node in the jQuery collection.
    
    //New Chart
    var myNewChart = new Chart(ctx);
    
    //This is one question
    var data = new Array();

    //Iterate through options
    var choices =
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
