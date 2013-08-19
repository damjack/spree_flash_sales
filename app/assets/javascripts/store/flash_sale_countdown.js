// encoding: utf-8

$(document).ready(function() {
	$("[data-countdown]").each(function() {
		var flashSaleEndDate = $(this).attr("data-countdown");
		var timeLayout = $(this).attr("data-layout");
		// endTime for event in db:
		var endDateTime = new Date(flashSaleEndDate);
		// Return the timezone difference between UTC and User Local Time
		// var date = new Date();
		var userTimeZoneDiff = endDateTime.getTimezoneOffset();
		// Since there are 60,000 milliseconds in a minute
		var MS_PER_MINUTE = 60000;
		// Event's final end date will depend on the final subtracted date as:
		var adjustedFlashSaleEndDate = new Date(endDateTime - userTimeZoneDiff * MS_PER_MINUTE);

		$(this).countdown({ 
			until: adjustedFlashSaleEndDate,
			layout: timeLayout
		});
	});
});