// # Place all the behaviors and hooks related to the matching controller here.
// # All this logic will automatically be available in application.js.
// # You can use CoffeeScript in this file: http://coffeescript.org/

$(window).keyup(function (e) {
	console.log('keyup')
    var code = (e.keyCode ? e.keyCode : e.which);
    if (code == 27 && $('.contact_customer:focus')) {
        $('.contact_customer').addClass('hidden');
        $('.subject_user_contact_form').val("");
        $('.message_user_contact_form').val("");
        $('.cancel_appointment').addClass('hidden');
    };
    if (code == 27 && $('.contact_mechanic_space:focus')) {
        $('.contact_mechanic_space').html('');
    };
});
$(document).on('click','.cancel_appointment_button', function() {
	$('.cancel_appointment').removeClass('hidden')
	$('.contact_customer').addClass('hidden');
})
$(document).on('turbolinks:load', function() {
	$('.close_cancel_appointment').on('click',function() {
		$('.cancel_appointment').addClass('hidden')
	})
	var $dashOffset = $(".path").css("stroke-dashoffset");
	var $textdashOffset = $(".text").css("stroke-dashoffset");

    //on a scroll event - execute function
    $(window).scroll(function() {
    //calculate how far down the page the user is 
	    var $percentageComplete = (($(window).scrollTop() / ($("html").height() - $(window).height())) * 12);
	    //convert dashoffset pixel value to interger
	    var $newUnit = parseInt($dashOffset, 10);
	    //get the value to be subtracted from the 'stroke-dashoffset'
	    var $offsetUnit = $percentageComplete * ($newUnit / 100);
	    //set the new value of the dashoffset to create the drawing effect
	    $(".path").css("stroke-dashoffset", $newUnit - $offsetUnit);
	    //text section
	    var $newtextUnit = parseInt($textdashOffset, 10);
	    //get the value to be subtracted from the 'stroke-dashoffset'
	    var $textoffsetUnit = $percentageComplete * ($newtextUnit / 100);
	    $(".text").css("stroke-dashoffset", $newtextUnit - $textoffsetUnit);

  });
	$(document).on('click', '.mechanic_appointment_button',function() {
		if($(this).next('.mechanic_appointment_details').hasClass('hidden')) {
			$(this).next('.mechanic_appointment_details').removeClass('hidden');
			$(this).next('.mechanic_appointment_details').animate({
				height:"30px"},"1000")
		}else{
			$(this).next('.mechanic_appointment_details').animate({
				height:"0px"},"1000", function() {
					$(this).addClass('hidden');
				}
			)
		}
		
	})
	setTimeout(function(){
		$('.notice').remove();
		$('.alert').remove();
	}, 5000);
	$(document).on('click', '.user_cancel_appointment',function() {
		appointment = this.getAttribute('data-appointment')
		console.log(appointment)
		$.ajax(
	    {
	      url:"/jobs/" + appointment,
	      type:'delete',
	      data: {
	      } 
	    });
	});
	$(document).on('click','.close_contact_user', function() {
		$('.contact_mechanic_space').html('');
	});
	$('.contact_customer_button').on('click',function() {
		$(this).nextAll(".contact_customer").toggleClass('hidden');
		$('.subject_user_contact_form').val("");
        $('.message_user_contact_form').val("");
        $('.cancel_appointment').addClass('hidden')
	});
	$('.close_contact_user').on('click',function() {
		$('.contact_customer').addClass('hidden');
		$('.subject_user_contact_form').val("");
        $('.message_user_contact_form').val("");
        $('.cancel_appointment').addClass('hidden')
	});
	$('.head_of_days').on('click',function() {
		$('.contact_customer').addClass('hidden');
		$('.subject_user_contact_form').val("");
        $('.message_user_contact_form').val("");
        $('.cancel_appointment').addClass('hidden')
	});
	$('.submit_user_contact_form').on('click',function() {
		$('.contact_customer').addClass('hidden');
	});

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
	});
	$('.full_width').on('click',function() {
		$(".adding_elements").html('');
	});
	$(document).on('click', '.fc-future', function() {
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
	});
	
	var date;
	var time;
	$(document).on('click','.available', function() {
		id = this.getAttribute('data-id');
		my_id = $("[data-id=" + id +"]");
		$.ajax({
		  type: "put",
		  url: '/jobs/'+ current_job,
		  data: {
		  	appointment_id: id,
		  	mechanic_id: current_mechanic,
		  },
		  success: function() {
		  	location.href = "/users/show"
		  },
		  error: function() {
          }
		});
	});
	
	$(document).on('click','.fc-today', function() {
		$('.mechanic_times').addClass('hidden')
	});
	
	$(document).on('click','.pullup_mechanic_button', function() {
		console.log('running')
		$(".adding_schedule").html(`
			<div><button class="contact_mechanic_button full_width" data-mechanic="#{mechanic.id}">Contact Mechanic</button>
			</div>
			<div class="mechanic_calendar_container">
				<div id="mechanic_calendar"></div>
			</div>

			<div class='mechanic_schedule_container'>
				<div class="mechanic_schedule">
					<div class="mechanic_schedule_head">
					</div>
					<div class="mechanic_schedule_body">
						<div class="mechanic_times">
						</div>
					</div>
				</div>
			</div>
			<div class="contact_mechanic_space">
			</div>
			`)
		current_mechanic = this.getAttribute('data-mechanic');
		$('#mechanic_calendar').fullCalendar({
			height:410,
    		contentHeight:410,
		    header: {
		        left: 'prev',
		        center: 'title today',
		        right: 'next'
		    },
		    body: {

		    }
		});
		$("html, body").animate({ scrollTop: '+=280px' }, 1000);
	});
	$(document).on('click','.fc-today', function() {
		future = $('.fc-future');
		today = $('.fc-today');
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
	});
	$(document).on('click', ".selected_with_job", function() {

	});
	$(document).on('click','.unselected', function() {
		_this = $(this);
		_this.attr('id', 'new');
		time = $(this).attr('data-time');
		datetime = new Date(date + " " + time)
		console.log(datetime)
		
		$.ajax({
		  type: "POST",
		  url: '/appointments',
		  data: {
		  	appointment: {
		  		date: datetime
		  	}

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
		$(".adding_elements").html('');
		$('.'+this.id).removeClass('hidden');
	});
	$(document).on('click','.edit_job_button', function() {
		$(".adding_elements").html('');
		$(this).next('.edit_job').removeClass('hidden');
	});
	$('.edit_mechanic_profile_link').on('click', function() {
		$('.edit_mechanic_profile').removeClass('hidden');
		$(".adding_elements").html('');
	});

	$('.edit_profile_link').on('click', function () {
		$(".adding_elements").html('');
		$('.edit_profile').removeClass('hidden');
		$('.add_vehicle').addClass('hidden');
	});
	$('.add_vehicle_link').on('click', function () {
		$(".adding_elements").html('');
		$('.edit_profile').addClass('hidden');
		$('.add_vehicle').removeClass('hidden');
	});

	$('.add_job_link').on('click', function() {
		$('.add_job').removeClass('hidden');
		$('.edit_mechanic_profile').addClass('hidden');
	})
	$('.edit_mechanic_link').on('click', function() {
		$('.add_job').addClass('hidden');
		$('.edit_mechanic_profile').removeClass('hidden');
	})

	$('.add_job_link').on('click', function() {
		$('.add_job').removeClass('hidden');
		$('.edit_mechanic_profile').addClass('hidden');
	})
	$('.edit_mechanic_link').on('click', function() {
		$('.add_job').addClass('hidden');
		$('.edit_mechanic_profile').removeClass('hidden');
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













