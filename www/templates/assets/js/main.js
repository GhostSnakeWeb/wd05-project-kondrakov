$(document).ready(function() {

	//Check button edit
	if ($('div').is('.blog__button--edit')) {
		$('.blog-post__title').addClass('string-clip');
	}

	//Map block
	function initMap() {

		var zelenograd = {lat: 55.987364, lng: 37.195591};

		myMap = new google.maps.Map(document.getElementById('map'), {

			center: zelenograd,
			zoom: 13,
			styles: [
			    {
			        "featureType": "administrative",
			        "elementType": "labels.text.fill",
			        "stylers": [
			            {
			                "color": "#444444"
			            }
			        ]
			    },
			    {
			        "featureType": "landscape",
			        "elementType": "all",
			        "stylers": [
			            {
			                "color": "#f2f2f2"
			            }
			        ]
			    },
			    {
			        "featureType": "poi",
			        "elementType": "all",
			        "stylers": [
			            {
			                "visibility": "off"
			            }
			        ]
			    },
			    {
			        "featureType": "road",
			        "elementType": "all",
			        "stylers": [
			            {
			                "saturation": -100
			            },
			            {
			                "lightness": 45
			            }
			        ]
			    },
			    {
			        "featureType": "road.highway",
			        "elementType": "all",
			        "stylers": [
			            {
			                "visibility": "simplified"
			            }
			        ]
			    },
			    {
			        "featureType": "road.arterial",
			        "elementType": "labels.icon",
			        "stylers": [
			            {
			                "visibility": "off"
			            }
			        ]
			    },
			    {
			        "featureType": "transit",
			        "elementType": "all",
			        "stylers": [
			            {
			                "visibility": "off"
			            }
			        ]
			    },
			    {
			        "featureType": "water",
			        "elementType": "all",
			        "stylers": [
			            {
			                "color": "#46bcec"
			            },
			            {
			                "visibility": "on"
			            }
			        ]
			    }
			]
		});	//map

		//Markers

		var markerZelenograd = new google.maps.Marker({

			position: zelenograd,

			map: myMap,

			title: 'Зеленоград',

			icon: '../img/map-icon/location-icon.png'

		});
	}

	//Registration check
	var checkRegistration = (function(){

		//Переменные
		var _email = "mail@mail.com";

		var _registrationForm = $('.registration-form');
		var _emailInput = $('#email-input');
		var _passwordInput = $('#password-input');

		var _emailErrorBlock = $('#email-error-block');
		var _wrongEmailFormatBlock = $('#wrong-email-format-block');
		var _passwordErrorBlock = $('#password-error-block');
		var _emailBusy = $('#email-busy');

		var init = function(){
			_setUpListeners();
		}

		//Прослушка события по submit
		var _setUpListeners = function(){
			_registrationForm.on('submit', function(event){
				_registrationValidate(event);
			});
		}

		var _registrationValidate = function (event) {
			console.log('private method _registrationValidate() is run');

			var form = _registrationForm,
				inputs = form.find('input'),
				pattern = /^([a-z0-9_\.-])+@[a-z0-9-]+\.([a-z]{2,4}\.)?[a-z]{2,4}$/i,
				emailVal = _emailInput.val().trim(),
				passwordVal = _passwordInput.val().trim();

			$.each(inputs, function(){
				
				if (emailVal.length === 0) {
					event.preventDefault();
					_emailErrorBlock.css('margin-top', '5px').fadeIn(600);
				} else {
					if (emailVal == _email) {
						event.preventDefault();
						_emailBusy.fadeIn(600);
					}
					if (pattern.test(emailVal)){
						console.log('Email is VALID!');
					} else {
						event.preventDefault();
						_emailBusy.fadeOut(400);
						_wrongEmailFormatBlock.css('margin-top', '5px').fadeIn(600);
						console.log('Email is INVALID!');
					}
				}

				if (passwordVal.length === 0) {
					event.preventDefault();
					_passwordErrorBlock.css('margin-top', '5px').fadeIn(600);
				}

				_emailInput.on('focus', function(){
					_emailErrorBlock.fadeOut(600, function(){
						_emailErrorBlock.css('margin-top', '0px');
					});
					_wrongEmailFormatBlock.fadeOut(600, function(){
						_wrongEmailFormatBlock.css('margin-top', '0px');
					});
				});

				_passwordInput.on('focus', function(){
					_passwordErrorBlock.fadeOut(600, function(){
						_passwordErrorBlock.css('margin-top', '0px');
					});
				});


			});
		}

		return {
			init
		}

	}());

	checkRegistration.init();

	//Login check
	var checkLogin = (function(){

		//Переменные
		var _loginForm = $('#login-form');
		var _emailInput = $('#email-input');
		var _passwordInput = $('#password-input');

		var _emailErrorBlock = $('#email-error-block');
		var _wrongEmailFormatBlock = $('#wrong-email-format-block');
		var _passwordErrorBlock = $('#password-error-block');
		var _emailPasswordWrongBlock = $('#email-password-wrong-block');

		var init = function(){
			_setUpListeners();
		}

		//Прослушка события по submit
		var _setUpListeners = function(){
			_loginForm.on('submit', function(event){
				_loginValidate(event);
			});
		}

		var _loginValidate = function (event) {
			console.log('private method _loginValidate() is run');

			var form = _loginForm,
				inputs = form.find('input'),
				pattern = /^([a-z0-9_\.-])+@[a-z0-9-]+\.([a-z]{2,4}\.)?[a-z]{2,4}$/i,
				emailVal = _emailInput.val().trim(),
				passwordVal = _passwordInput.val().trim();

			$.each(inputs, function(){
				
				if (emailVal.length === 0 || passwordVal.length === 0) {
					if (emailVal.length === 0) {
						event.preventDefault();
						_emailPasswordWrongBlock.fadeOut(400);
						_emailErrorBlock.css('margin-top', '5px').fadeIn(600);
					}

					if (passwordVal.length === 0) {
						event.preventDefault();
						_emailPasswordWrongBlock.fadeOut(0);
						_passwordErrorBlock.css('margin-top', '5px').fadeIn(600);
					}
				} else {

					if (!(pattern.test(emailVal))) {
						event.preventDefault();
						_emailPasswordWrongBlock.fadeOut(400);
						_wrongEmailFormatBlock.css('margin-top', '5px').fadeIn(600);
						console.log('Email is INVALID!');
					} else if (pattern.test(emailVal) && emailVal != _email && passwordVal == _password) {
						event.preventDefault();
						_emailPasswordWrongBlock.fadeIn(600);
						console.log('Email is INVALID!');
					} else if (pattern.test(emailVal) && emailVal == _email && passwordVal != _password) {
						event.preventDefault();
						_emailPasswordWrongBlock.fadeIn(600);
						console.log('Email is INVALID!');
					} else if (pattern.test(emailVal) && emailVal != _email && passwordVal != _password) {
						event.preventDefault();
						_emailPasswordWrongBlock.fadeIn(600);
						console.log('Email is INVALID!');
					} else {
						console.log('Email is VALID!');
					}
				}

				_emailInput.on('focus', function(){
					_emailErrorBlock.fadeOut(600, function(){
						_emailErrorBlock.css('margin-top', '0px');
					});
					_wrongEmailFormatBlock.fadeOut(600, function(){
						_wrongEmailFormatBlock.css('margin-top', '0px');
					});
				});

				_passwordInput.on('focus', function(){
					_passwordErrorBlock.fadeOut(600, function(){
						_passwordErrorBlock.css('margin-top', '0px');
					});
				});


			});
		}

		return {
			init
		}

	}());

	checkLogin.init();


	//Check comments function
	var checkComment = (function(){

		// Переменные формы и ошибки
		var _form = $('#comment-form');
		var _errorBlock =$('#error-block');
		var _error = $('.notify-hide');

		var init = function(){
			_setUpListeners();
		}

		var _setUpListeners = function(){
			_form.on('submit', function(event){
				_textareaValidate(event);
			});
		}

		var _textareaValidate = function (event) {
			console.log('private method _formValidate() is run');

			var form = _form,
				textarea = form.find('textarea'),
				fadeInError;

			$.each(textarea, function(index,val) {
				var textarea = $(val),
					value = textarea.val().trim();
				console.log('textarea = ' + textarea);
				console.log('value = ' + value);

				if (value.length === 0){
					fadeInError = _error.removeClass(_error).fadeIn();;
					event.preventDefault();
				}
			});

			textarea.on('keydown', function(){
				fadeInError = _error.addClass(_error).fadeOut();
			});
		}

		return {
			init
		}
	
	}());
  
	checkComment.init();

	//FadeOut notification
	setTimeout(function(){ 
		$('[data-notify-hide]').slideUp(400);
	}, 2000);

	$('[data-notify-hide]').dblclick(function(event) {
		$(this).slideUp(400);
	});	

	$('input[name=postImg]').change(function(event) {
		var input = $(this)[0];
		console.log(input);
	});

});