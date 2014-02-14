Template.topnav.rendered = ->
	$.simpleWeather
		location: 'Harbin, CN'
		unit: 'f'
		success: (weather) ->
			html = "气温是 #{weather.tempAlt}"
			($ '#currentWeather').html html
