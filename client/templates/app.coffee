Router.configure
	layoutTemplate: 'layout'

Router.before ->
	unless Meteor.userId()
		Router.go Router.routes['backend-signin'].path()
		@stop()
, except: ['home', 'talks', 'suggestions', 'messages', 'achievements', 'sign', 'backend-signin', 'viewNotice', 'viewSuggestion']

Meteor.startup ->

	moment.lang('zh-cn')

	Meteor.setInterval ->
		($ '#currentDatetime').text moment().format('您好，今天是YYYY年M月D日、dddd、A HH:mm:ss')
	, 1000

	Meteor.setInterval ->
		$.simpleWeather
		location: 'Harbin, CN'
		unit: 'f'
		success: (weather) ->
			html = "气温是 #{weather.tempAlt}"
			($ '#currentWeather').html html
	, (60 * 1000)
