Helper = Handlebars.registerHelper

Helper 'activeFor', (path) ->
	return 'active'	if Router.current().route.name is path

Helper 'currentMoment', ->
	return Date.now()

Helper 'moment', (date, pattern) ->
	return moment(date).format(pattern)

Helper 'isRole', (user, role) ->
	return true if user.role is role