$(document).ready(function(){
  var nowDate = new Date();
  var today = new Date(nowDate.getFullYear(), nowDate.getMonth(), nowDate.getDate(), 0, 0, 0, 0);
  $('.new_apartments_filter_form .input-daterange').datepicker({
    format: "yyyy-mm-dd",
    startDate: today
  });

  $("#apartments_filter_form_price").slider({
    ticks: [0, 2000],
    tooltip: 'hide',
    ticks_tooltip: true
  });
  $("#apartments_filter_form_price").on("slide", function(slideEvt) {
    $("#price_min_val").text(slideEvt.value[0] + '$');
    $("#price_max_val").text(slideEvt.value[1] + '$');
  });

  var occ_field = $('#apartments_filter_form_occupancy');
  $('#plus').click(function() {
    var value = occ_field.val();
    if (value >= 1 && value <= 10){
      occ_field.val(+occ_field.val()+1);
    } else if (value === '') {
      occ_field.val(1);
    }
  });
  $('#minus').click(function() {
    var value = occ_field.val();
    if (value >= 2 && value <= 11){
      occ_field.val(+occ_field.val()-1);
    }  else if (value == 1) {
      occ_field.val('');
    }
  });
});