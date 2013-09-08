var questions = $('.q_num');

$(document).ready(function() {
  
    var ctx = $("#myChart").get(1).getContext("2d");
  $('.q_num').each(function(index) {
    //Get context with jQuery - using jQuery's .get() method.
    console.log(ctx);
    //This will get the first returned node in the jQuery collection.
    var myNewChart = new Chart(ctx);
    
    //One question at a time

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
