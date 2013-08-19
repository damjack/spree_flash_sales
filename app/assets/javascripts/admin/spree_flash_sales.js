//= require admin/spree_core
//= require admin/flash_sales/index
//= require jquery.datetimepicker

handle_datetime_picker_fields = function(){
  $('.timepicker').datetimepicker({
    showOn: "focus",
    showTimezone: true,
    showSecond: true,
    dateFormat: "yy/mm/dd",
    timeFormat: "HH:mm:ss z",
    timeOnlyTitle: "Time only",
    timeText: "Time",
    hourText: "Hour",
    minuteText: "Minute",
    secondText: "Second",
    currentText: "Current",
    closeText: "Close"
  });

}

$(document).ready(function(){
  handle_datetime_picker_fields();
});
