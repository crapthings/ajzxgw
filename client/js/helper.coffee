Helper = Handlebars.registerHelper

Helper 'moment', (pattern) ->
	return moment().format(pattern)
