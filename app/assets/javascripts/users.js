// # Place all the behaviors and hooks related to the matching controller here.
// # All this logic will automatically be available in application.js.
// # You can use CoffeeScript in this file: http://coffeescript.org/

$(document).on('turbolinks:load', function() {

	var date;
	var time;
	$('#mechanic_appointments_calendar').fullCalendar({
	    header: {
	        left: 'prev',
	        center: 'title today',
	        right: 'next'
	    },
	    body: {

	    }
	}).on('click', '.fc-future', function() {
		$('.mechanic_appointments_times').removeClass('hidden')

		future = $('.fc-future')
		for (var i = 0; i < future.length; i++) {
		    future[i].style.backgroundColor = "#ffffff";
		    future[i].style.opacity = "0.9";
		}
		this.style.backgroundColor = "lightblue"
	    date = this.getAttribute('data-date')
	    $('.mechanic_appointments_head').html('<h2>' + date + '</h2>')
	    $('.mechanic_appointments_head').text(date)

		$.ajax(
	    {
	      url:"/mechanics/view_jobs",
	      type:'get',
	      data: {
	      	date: date,
	      } 
	    });
	});
	$('.fc-today').on('click', function() {
		$('.mechanic_appointments_times').addClass('hidden')
	})
	
	var date;
	var time;
	$('#calendar').fullCalendar({
	    header: {
	        left: 'prev',
	        center: 'title today',
	        right: 'next'
	    },
	    body: {

	    }
	}).on('click', '.fc-future', function() {
		$('.times').removeClass('hidden')
		future = $('.fc-future')
		for (var i = 0; i < future.length; i++) {
		    future[i].style.backgroundColor = "#ffffff";
		    future[i].style.opacity = "0.9";
		}
		this.style.backgroundColor = "lightblue"
	    date = this.getAttribute('data-date')
	    $('.schedule_head').html('<h2>' + date + '</h2>')

		$.ajax(
	    {
	      url:"/appointments/new",
	      type:'get',
	      data: {
	      	date: date,
	      }
	    });
	    
	});
	$('.fc-today').on('click', function() {
		$('.times').addClass('hidden')
	})
	$(document).on('click','.selected', function() {
		id = this.getAttribute('data-id')
		my_id = $("[data-id=" + id +"]");
		$.ajax({
		  type: "delete",
		  url: '/appointments/'+id,
		  data: {
		  	id: id
		  },
		  success: function() {
		  	my_id.addClass('unselected')
		  	my_id.removeClass('selected')
		  },
		  error: function() {
          }
		});
	})
	$(document).on('click', ".selected_with_job", function() {

	})
	$(document).on('click','.unselected', function() {
		_this = $(this);
		_this.attr('id', 'new');
		time = $(this).attr('data-time');
		my_time = $("[data-time=" + time +"]");
		
		$.ajax({
		  type: "POST",
		  url: '/appointments',
		  data: {
		  	date: date,
		  	hour: time,

		  },
		  success: function() {
		  	_this.addClass('selected');
		  	_this.removeClass('unselected');
		  },
		  error: function() {
		  	_this.addClass('selected');
		  	_this.removeClass('unselected');
          }
		});
	});
	
	$('.edit_vehicle_button').on('click', function() {
		console.log('hidden')
		$(this).next('.edit_vehicle').removeClass('hidden')
	})
	$('.edit_job_button').on('click', function() {
		$(this).next('.edit_job').removeClass('hidden')
	})
	$('.edit_mechanic_profile_link').on('click', function() {
		$('.edit_mechanic_profile').removeClass('hidden')
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













