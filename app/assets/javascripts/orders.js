$(document).ready(function(){
  var nowDate = new Date();
  var today = new Date(nowDate.getFullYear(), nowDate.getMonth(), nowDate.getDate(), 0, 0, 0, 0);
  $('.new_order .input-daterange').datepicker({
    format: "yyyy-mm-dd",
    startDate: today
  });
  $('.edit_order .input-daterange').datepicker({
    format: "yyyy-mm-dd"
  });
});
