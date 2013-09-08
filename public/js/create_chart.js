$(document).ready(function() {

  //Get context with jQuery - using jQuery's .get() method.
  var ctx = $("#myChart").get(0).getContext("2d");
//This will get the first returned node in the jQuery collection.
  var myNewChart = new Chart(ctx);
  var data = [
  {
    value: 30,
    color: "#F38630",
    label: "Whatevs"
  },
  {
    value: 50,
    color: "#E0E4CC",
    label: "Blargh"
  },
  {
    value: 100,
    color: "#69D2E7",
    label: "Dat"
  }     
];
  new Chart(ctx).Pie(data);
});
