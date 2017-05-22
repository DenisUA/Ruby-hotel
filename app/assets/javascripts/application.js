//= require_tree .
//= require jquery
//= require jquery_ujs
//= require bootstrap-sprockets
//= require bootstrap-datepicker

$(document).ready(function(){
  $('#new_order .input-daterange').datepicker({
    format: "dd/mm/yyyy"
  });
});