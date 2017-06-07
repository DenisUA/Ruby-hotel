$(document).ready(function(){
  var nowDate = new Date();
  var today = new Date(nowDate.getFullYear(), nowDate.getMonth(), nowDate.getDate(), 0, 0, 0, 0);
  $('.new_apartments_filter_form .input-daterange').datepicker({
    format: "yyyy-mm-dd",
    startDate: today
  });

  $("#apartments_filter_form_price").slider({
    ticks: [10, 2000],
    ticks_labels: ['$10', '$2000'],
    ticks_snap_bounds: 100
  });

  var occ_field = $('#apartments_filter_form_occupancy');
  $('#plus').click(function() {
    var value = occ_field.val();
    if (value >= 1 && value <= 10){
      occ_field.val(+occ_field.val()+1);
    } else if (value == null) {
      occ_field.val(1);
    };
  });
  $('#minus').click(function() {
    var value = occ_field.val();
    if (value >= 2 && value <= 11){
      occ_field.val(+occ_field.val()-1);
    }  else if (value == null) {
      occ_field.val(1);
    };
  });
});