// # Place all the behaviors and hooks related to the matching controller here.
// # All this logic will automatically be available in application.js.
// # You can use CoffeeScript in this file: http://coffeescript.org/

$(document).on('turbolinks:load', function() {

	$('.edit_vehicle_button').on('click', function() {
		console.log('hidden')
		$(this).next('.edit_vehicle').removeClass('hidden')
	})
	$('.edit_job_button').on('click', function() {
		$(this).next('.edit_job').removeClass('hidden')
	})

	$('.edit_profile_link').on('click', function () {
		$('.edit_profile').removeClass('hidden');
		$('.add_vehicle').addClass('hidden');
	})
	$('.add_vehicle_link').on('click', function () {
		$('.edit_profile').addClass('hidden');
		$('.add_vehicle').removeClass('hidden');
	})

	$('#dropdownMenuButton').on('click', function (event) {
	    $('.test').toggleClass('show');
	    $('.test1').removeClass('show');
	});
	$('body').on('click', function (e) {
	    if (!$('#dropdownMenuButton').is(e.target) 
	        && $('#dropdownMenuButton').has(e.target).length === 0 
	        && $('.show').has(e.target).length === 0
	    ) {
	        $('.test').removeClass('show');
	    }
	});
	$('#dropdownMenuButton1').on('click', function (event) {
	    $('.test1').toggleClass('show');
	    $('.test').removeClass('show');
	});
	$('body').on('click', function (e) {
	    if (!$('#dropdownMenuButton1').is(e.target) 
	        && $('#dropdownMenuButton1').has(e.target).length === 0 
	        && $('.show').has(e.target).length === 0
	    ) {
	        $('.test1').removeClass('show');
	    }
	});

	window.Parsley.addAsyncValidator('user_email_unique', function (data) {
		if (data.responseJSON.email_unique == true) {
			$("#loading").removeClass("hidden");
			$(".email_check_animation").removeClass("loading");
			$(".email_check_animation").removeClass("already_taken");
			$(".email_check_animation").addClass("success");
			$(".please_wait").text("Email Available");
		}
		else if (data.responseJSON.email_unique == false) {
			$("#loading").removeClass("hidden");
			$(".email_check_animation").removeClass("loading");
			$(".email_check_animation").removeClass("success");
			$(".email_check_animation").addClass("already_taken");
			$(".please_wait").text("Email Already In Use");
		}
	    return data.responseJSON.email_unique;
	  }, '/home/unique_user_email');

	window.Parsley.addAsyncValidator('mechanic_email_unique', function (data) {
		if (data.responseJSON.email_unique == true) {
			$("#mechanic_loading").removeClass("hidden");
			$(".mechanic_check_animation").removeClass("loading");
			$(".mechanic_check_animation").removeClass("already_taken");
			$(".mechanic_check_animation").addClass("success");
			$(".mechanic_please_wait").text("Email Available");
		}
		else if (data.responseJSON.email_unique == false) {
			$("#mechanic_loading").removeClass("hidden");
			$(".mechanic_check_animation").removeClass("loading");
			$(".mechanic_check_animation").removeClass("success");
			$(".mechanic_check_animation").addClass("already_taken");
			$(".mechanic_please_wait").text("Email Already In Use");
		}
	    return data.responseJSON.email_unique;
	  }, '/home/unique_mechanic_email');

	$('#email').change(function () {
		$("#loading").removeClass("hidden");
		if (document.getElementById('email').value.length < 5) {
			$("#loading").removeClass("hidden");
			$(".email_check_animation").removeClass("success");
			$(".email_check_animation").removeClass("already_taken");
			$(".email_check_animation").addClass("loading");
			$(".please_wait").text("Email doesn't meet criteria");
		}
	});

	$('#mechanic_email').change(function () {
		$("#mechanic_loading").removeClass("hidden");
		if (document.getElementById('mechanic_email').value.length < 5) {
			$("#mechanic_loading").removeClass("hidden");
			$(".mechanic_check_animation").removeClass("success");
			$(".mechanic_check_animation").removeClass("already_taken");
			$(".mechanic_check_animation").addClass("loading");
			$(".mechanic_please_wait").text("Email doesn't meet criteria");
		}
	});
	

	
});













