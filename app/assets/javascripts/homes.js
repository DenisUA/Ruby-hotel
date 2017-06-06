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
});