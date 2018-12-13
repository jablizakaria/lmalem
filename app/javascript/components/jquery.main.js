// page init
$(document).ready(function() {

	"use strict";

	jQuery("#contactForm").validator().on("submit", function (event) {

		"use strict";

		if (event.isDefaultPrevented()) {
			// handle the invalid form...
			formError();
			submitMSG(false, "Please Follow Error Messages and Complete as Required");
		} else {
			// everything looks good!
			event.preventDefault();
			submitForm();
		}
	});

	function submitForm(){
		
		"use strict";

		// Initiate Variables With Form Content
		var name = $("#name").val();
		var email = $("#email").val();
		var message = $("#message").val();

		$.ajax({
			type: "POST",
			url: "php/form-process.php",
			data: "name=" + name + "&email=" + email + "&message=" + message,
			success : function(text){
				if (text == "success"){
					formSuccess();
				} else {
					formError();
					submitMSG(false,text);
				}
			}
		});
	}

	function formSuccess(){
		
		"use strict";

		$("#contactForm")[0].reset();
		submitMSG(true, "Thank you for your submission :)")
	}

	function formError(){
		
		"use strict";

		$("#contactForm").removeClass().addClass('shake animated').one('webkitAnimationEnd mozAnimationEnd MSAnimationEnd oanimationend animationend', function(){
			$(this).removeClass();
		});
	}

	function submitMSG(valid, msg){
		
		"use strict";

		if(valid){
			var msgClasses = "success form-message";
		} else {
			var msgClasses = "error form-message";
		}
		$("#msgSubmit").removeClass().addClass(msgClasses).text(msg);
	}

	jQuery("#contactForm2").validator().on("submit", function (event) {

		"use strict";

		if (event.isDefaultPrevented()) {
			// handle the invalid form...
			formError();
			submitMSG2(false, "Please Follow Error Messages and Complete as Required");
		} else {
			// everything looks good!
			event.preventDefault();
			submitForm();
		}
	});

	function submitForm(){
		
		"use strict";

		// Initiate Variables With Form Content
		var name2 = $("#name2").val();
		var email2 = $("#email2").val();
		var tel2 = $("#tel2").val();

		$.ajax({
			type: "POST",
			url: "php/form-process2.php",
			data: "name2=" + name2 + "&email2=" + email2 + "&tel2=" + tel2,
			success : function(text){
				if (text == "success"){
					formSuccess();
				} else {
					formError();
					submitMSG2(false,text);
				}
			}
		});
	}

	function formSuccess(){
		
		"use strict";

		$("#contactForm2")[0].reset();
		submitMSG2(true, "Thank you for your submission :)")
	}

	function formError(){
		
		"use strict";

		$("#contactForm2").removeClass().addClass('shake animated').one('webkitAnimationEnd mozAnimationEnd MSAnimationEnd oanimationend animationend', function(){
			$(this).removeClass();
		});
	}

	function submitMSG2(valid, msg){
		
		"use strict";

		if(valid){
			var msgClasses = "success form-message";
		} else {
			var msgClasses = "error form-message";
		}
		$("#msgSubmit2").removeClass().addClass(msgClasses).text(msg);
	}

	initAddClass();
	// Add Class  init
	function initAddClass() {
		"use strict";
		
		jQuery('.nav-opener').on( "click", function(e){
			e.preventDefault();
			jQuery("body").toggleClass("nav-active");
		});
	}

	initSlickSlider();
	// Slick Slider init
	function initSlickSlider() {
		"use strict";

		jQuery('.main-slider').slick({
			dots: false,
			speed: 800,
			infinite: true,
			slidesToShow: 1,
			slidesToScroll: 1,
			adaptiveHeight: true,
			autoplay: true,
			arrows: true,
			fade: true,
			autoplaySpeed: 4000
		});
		jQuery('.testimonail-slider').slick({
			dots: false,
			speed: 800,
			infinite: true,
			slidesToShow: 3,
			slidesToScroll: 1,
			adaptiveHeight: true,
			autoplay: true,
			arrows: false,
			autoplaySpeed: 4000,
			responsive: [
			    {
			      breakpoint: 1023,
			      settings: {
			        slidesToShow: 2,
			        infinite: true
			      }
			    },
			    {
			      breakpoint: 767,
			      settings: {
			        slidesToShow: 1,
			        infinite: true
			      }
			    }
			]
		});
	}

	initbackTop();
	// backtop init
	function initbackTop() {
		"use strict";

	    var jQuerybackToTop = jQuery("#back-top");
	    jQuery(window).on('scroll', function() {
	        if (jQuery(this).scrollTop() > 100) {
	            jQuerybackToTop.addClass('active');
	        } else {
	            jQuerybackToTop.removeClass('active');
	        }
	    });
	    jQuerybackToTop.on('click', function(e) {
	        jQuery("html, body").animate({scrollTop: 0}, 900);
	    });
	}

	initLightbox();
	// modal popup init
	function initLightbox() {
		
		"use strict";

		jQuery('a.lightbox, a[rel*="lightbox"]').fancybox({
			padding: 0
		});
	}

	initCustomForms();
	// initialize custom form elements
	function initCustomForms() {
		jcf.replaceAll();
	}

	
	initStyleChanger();
	// style changer
	function initStyleChanger() {
		"use strict";
		
		var element = jQuery('#style-changer');

		if(element) {
			$.ajax({
				url: element.attr('data-src'),
				type: 'get',
				dataType: 'text',
				success: function(data) {
					var newContent = jQuery('<div>', {
						html: data
					});

					newContent.appendTo(element);
				}
			});
		}
	}

	
	$.scrollIt({
		topOffset: -84,
		scrollTime: 1500,
		easing: 'easeInOutExpo'
	});

    initStickyHeader();
	// sticky header init
	function initStickyHeader() {

		"use strict";

		var win = jQuery(window),
			stickyClass = 'sticky';

		jQuery('#header .nav-holder').each(function() {
			var header = jQuery(this);
			var headerOffset = header.offset().top || 0;
			var flag = true;


			jQuery(this).css('height' , jQuery(this).innerHeight());

			function scrollHandler() {
				if (win.scrollTop() > headerOffset) {
					if (flag){
						flag = false;
						header.addClass(stickyClass);
					}
				} else {
					if (!flag) {
						flag = true;
						header.removeClass(stickyClass);
					}
				}
			}

			scrollHandler();
			win.on('scroll resize orientationchange', scrollHandler);
		});
	}

	initAnchors();
	// initialize smooth anchor links
	function initAnchors() {
		new SmoothScroll({
			anchorLinks: 'a.smooth[href^="#"]:not([href="#"])'
		});
	}
	
	initVegasSlider();
	// Vegas Slider init
	function initVegasSlider() {
	  jQuery("#bgvid").vegas({
	      slides: [
	        {   src: 'images/img22.jpg',
	            video: {
	                src: [
	                    'video/polina.webm',
	                    'video/polina.mp4'
	                ],
	                loop: true,
	                timer: false,
	                mute: true
	            }
	        }
	    ]
	  });
	}
	
	initTextRotator2();
	// TextRotator2 init
	function initTextRotator2() {
		"use strict";

   		$('#rotating2').textillate({
	      // the default selector to use when detecting multiple texts to animate
	      selector: '.rotating-hold',

	      // enable looping
	      loop: true,

	      // sets the minimum display time for each text before it is replaced
	      minDisplayTime: 2000,

	      // sets the initial delay before starting the animation
	      // (note that depending on the in effect you may need to manually apply 
	      // visibility: hidden to the element before running this plugin)
	      initialDelay: 0,

	      // set whether or not to automatically start animating
	      autoStart: true,

	      // custom set of 'in' effects. This effects whether or not the 
	      // character is shown/hidden before or after an animation  
	      inEffects: [],

	      // custom set of 'out' effects
	      outEffects: [ 'fadeIn' ],

	      // in animation settings
	      in: {
	        // set the effect name
	        effect: 'rotateInUpRight',

	        // set the delay factor applied to each consecutive character
	        delayScale: 1.5,

	        // set the delay between each character
	        delay: 50,

	        // set to true to animate all the characters at the same time
	        sync: false,

	        // randomize the character sequence 
	        // (note that shuffle doesn't make sense with sync = true)
	        shuffle: false,

	        // reverse the character sequence 
	        // (note that reverse doesn't make sense with sync = true)
	        reverse: false,

	        // callback that executes once the animation has finished
	        callback: function () {}
	      },

	      // out animation settings.
	      out: {
	        effect: 'fadeOut',
	        delayScale: 1.5,
	        delay: 50,
	        sync: true,
	        shuffle: false,
	        reverse: false,
	        callback: function () {}
	      },

	      // callback that executes once textillate has finished 
	      callback: function () {},

	      // set the type of token to animate (available types: 'char' and 'word')
	      type: 'char'
	    });
	}

	initTextRotator3();
	// TextRotator3 init
	function initTextRotator3() {
		"use strict";

		jQuery("#rotating3").typed({
			strings: ["Present", "Produce", "Preview"],
			loop: true,
			typeSpeed: 100
		});
	}
	
});


jQuery(window).on('load', function() {

	"use strict";

	initPreLoader()
	// PreLoader init
	function initPreLoader() {
	    "use strict";

	    jQuery('#loader').delay(1000).fadeOut();
	}
	
});